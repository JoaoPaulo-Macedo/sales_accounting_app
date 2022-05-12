import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/domain/entities/week_common_values_entity.dart';
import 'package:lucky_triangle/app/domain/usecases/get_week_common_values_usecase.dart';
import 'package:lucky_triangle/app/domain/usecases/set_week_common_values_usecase.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_states.dart';
import 'package:lucky_triangle/core/utils/app_exception.dart';

part 'utils/home_enums.dart';
part 'utils/home_properties.dart';
part 'utils/home_validators.dart';
part 'utils/home_text_controllers_helper.dart';

class HomeCubit extends Cubit<HomeState> with HomeProperties {
  HomeCubit(this._getCommonValuesUseCase, this._setCommonValuesUseCase) : super(Loading()) {
    _init();
  }

  final GetWeekCommonValuesUseCase _getCommonValuesUseCase;
  final SetWeekCommonValuesUseCase _setCommonValuesUseCase;
  late WeekCommonValuesEntity _valuesEntity;

  void _init() async {
    await _fetchValues();

    _total = _valuesEntity.totalCards;
    totalCtrl.text = _total?.toString() ?? '';
    _tax = _valuesEntity.tax;
    taxCtrl.text = _tax?.toString() ?? '';
    _allowance = _valuesEntity.allowance;
    allowanceCtrl.text = _allowance?.toString() ?? '';

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
    _valuesEntity =
        await _getCommonValuesUseCase() ?? WeekCommonValuesEntity(totalCards: null, tax: null, allowance: null);
  }

  void _setValues() async {
    emit(Saving(price: state.price));

    _valuesEntity.totalCards = int.tryParse(totalCtrl.text);
    _valuesEntity.tax = double.tryParse(taxCtrl.text);
    _valuesEntity.allowance = double.tryParse(allowanceCtrl.text);

    await Future.delayed(const Duration(seconds: 1));

    await _setCommonValuesUseCase(_valuesEntity);

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

      double grossDebt = _sold! * (_price! * 0.82);
      double earnRate = _price! * 0.08;
      double taxRate = _tax! / 100;
      double taxDebt = (_sold! * earnRate) * taxRate;
      double missingDebt = _missing! > 0 ? _missing! * _price! : 0;

      double debt = grossDebt + missingDebt + taxDebt - _paid - _deposits - _allowance!;

      Situation situation = debt > 0 ? Situation.debt : Situation.credit;

      emit(Calculated(price: state.price, debt: debt, situation: situation));
    } on AppException catch (e) {
      if (state is Error && e.message == (state as Error).error.message) return;

      emit(Error(price: state.price, error: e));
    } catch (e) {
      if (state is Error) return;

      var error = AppException('Erro');

      emit(Error(price: state.price, error: error));
    }
  }
}
