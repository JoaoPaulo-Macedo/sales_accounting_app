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

    // _total = commonValues.totalCards;
    totalCtrl.text = commonValues.totalCards?.toString() ?? '';
    // commonValues.tax = commonValues.tax;
    taxCtrl.text = commonValues.tax?.toString() ?? '';
    // commonValues.allowance = commonValues.allowance;
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
      emitOnMissing: () => emit(Reload(price: state.price)),
    );

    emit(Fetched());
  }

  Future _fetchValues() async {
    commonValues =
        await _getCommonValuesUseCase() ?? WeekCommonValuesEntity(totalCards: null, tax: null, allowance: null);
  }

  void _setValues() async {
    emit(Saving(price: state.price));

    commonValues.totalCards = int.tryParse(totalCtrl.text);
    commonValues.tax = double.tryParse(taxCtrl.text);
    commonValues.allowance = double.tryParse(allowanceCtrl.text);

    await Future.delayed(const Duration(seconds: 1));

    await _setCommonValuesUseCase(commonValues);

    emit(Reload(price: state.price));
  }

  void changeSelected(Price price) {
    emit(Reload(price: price));

    _calculate();
  }

  void _calculate() {
    if (!_validateToCalculate()) {
      emit(Calculated(price: state.price, debt: null, situation: null));

      return;
    }

    try {
      if (state.price == Price.none) return;
      if (!_validateFields()) return;

      double grossDebt = raffle.sold! * (raffle.price! * 0.82);
      double earnRate = raffle.price! * 0.08;
      double taxRate = commonValues.tax! / 100;
      double taxDebt = (raffle.sold! * earnRate) * taxRate;
      double missingDebt = raffle.missing! > 0 ? raffle.missing! * raffle.price! : 0;

      double debt =
          grossDebt + missingDebt + taxDebt - reckoning.money! - reckoning.deposits! - commonValues.allowance!;

      Situation situation = debt > 0 ? Situation.debt : Situation.credit;

      emit(Calculated(price: state.price, debt: debt, situation: situation));
    } on AppException catch (e) {
      if (state is Error && e.message == (state as Error).error.message) return;

      emit(Error(price: state.price, error: e));
    } /* catch (e) {
      if (state is Error) return;

      var error = AppException('Erro');

      emit(Error(price: state.price, error: error));
    } */
  }
}
