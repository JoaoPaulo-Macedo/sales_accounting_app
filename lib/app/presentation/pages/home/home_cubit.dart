import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:reckoning/app/domain/entities/raffle_week_entity.dart';
import 'package:reckoning/app/domain/entities/reckoning_entity.dart';
import 'package:reckoning/app/domain/entities/week_common_values_entity.dart';
import 'package:reckoning/app/domain/usecases/get_week_common_values_usecase.dart';
import 'package:reckoning/app/domain/usecases/set_week_common_values_usecase.dart';
import 'package:reckoning/app/presentation/pages/home/home_states.dart';
import 'package:reckoning/app/presentation/pages/home/utils/home_enums.dart';
import 'package:reckoning/core/utils/app_exception.dart';

part 'utils/home_properties.dart';
part 'utils/home_validators.dart';
part 'utils/home_text_controllers_helper.dart';

class HomeCubit extends Cubit<HomeState> with HomeProperties {
  HomeCubit(this._getCommonValuesUseCase, this._setCommonValuesUseCase) : super(Loading()) {
    _init();
  }

  final GetWeekCommonValuesUseCase _getCommonValuesUseCase;
  final SetWeekCommonValuesUseCase _setCommonValuesUseCase;

  void _init() async {
    await _fetchValues();

    totalCtrl.text = commonValues.totalCards?.toString() ?? '';
    taxCtrl.text = commonValues.tax?.toString() ?? '';
    allowanceCtrl.text = commonValues.allowance?.toString() ?? '';

    commonValues.allowance = 200;

    _commonsTyped.addListener(() async {
      if (_commonsTyped.value) {
        await Future.delayed(const Duration(seconds: 3));

        _setValues();

        _commonsTyped.value = false;
      }
    });

    initControllers(
      emitOnMissing: () => emit(Reload(
        price: raffle.price,
        situation: reckoning.situation,
        debt: reckoning.debt,
      )),
    );

    emit(Fetched());
  }

  Future _fetchValues() async {
    commonValues =
        await _getCommonValuesUseCase() ?? WeekCommonValuesEntity(totalCards: null, tax: null, allowance: null);
  }

  void _setValues() async {
    emit(Saving(price: raffle.price, situation: reckoning.situation, debt: reckoning.debt));

    commonValues.totalCards = int.tryParse(totalCtrl.text);
    commonValues.tax = double.tryParse(taxCtrl.text);
    commonValues.allowance = double.tryParse(allowanceCtrl.text);

    await Future.delayed(const Duration(seconds: 1));

    await _setCommonValuesUseCase(commonValues);

    emit(Reload(price: raffle.price, situation: reckoning.situation, debt: reckoning.debt));
  }

  void changeSelected(Price price) {
    raffle.price = price;
    emit(Reload(price: price, situation: reckoning.situation, debt: reckoning.debt));

    _calculate();
  }

  void _calculate() {
    log('Calculate');
    if (!_validateToCalculate()) {
      log('Did not validate');

      if (reckoning.situation != Situation.none) {
        reckoning.situation = Situation.none;
        emit(Reload(price: raffle.price, situation: reckoning.situation, debt: reckoning.debt));
      }

      return;
    }
    log('Validated');

    try {
      if (!_validateFields()) return;

      double price = 0;

      switch (raffle.price) {
        case Price.ten:
          price = 10;
          break;
        case Price.fifteen:
          price = 15;
          break;
        case Price.twenty:
          price = 20;
          break;
        case Price.twentyFive:
          price = 25;
          break;
        case Price.thirty:
          price = 30;
          break;
        case Price.none:
          throw Exception();
      }

      double grossDebt = raffle.sold! * (price * 0.82);
      double earnRate = price * 0.08;
      double taxRate = commonValues.tax! / 100;
      double taxDebt = (raffle.sold! * earnRate) * taxRate;
      double missingDebt = raffle.missing! > 0 ? raffle.missing! * price : 0;

      reckoning.debt =
          grossDebt + missingDebt + taxDebt - reckoning.money - reckoning.deposits - commonValues.allowance!;

      reckoning.situation = reckoning.debt > 0 ? Situation.debt : Situation.credit;

      emit(Reload(price: raffle.price, situation: reckoning.situation, debt: reckoning.debt));
    } on AppException catch (e) {
      if (state is Error && e.message == (state as Error).error.message) return;

      emit(Error(error: e, price: raffle.price));
    } catch (e) {
      debugPrint(e.toString());

      if (state is Error) return;

      var error = AppException('Erro');

      emit(Error(error: error, price: raffle.price));
    }
  }
}
