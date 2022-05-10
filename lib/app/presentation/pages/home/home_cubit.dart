import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/domain/usecases/get_week_common_values_usecase.dart';

enum Price { none, ten, fifteen, twenty, twentyFive, thirty }

enum Reckoning { none, debt, credit }

abstract class HomeState {
  HomeState({this.price = Price.none, this.reckoning = Reckoning.none});

  Price price;
  Reckoning reckoning;
}

class Loading extends HomeState {}

class Fetched extends HomeState {}

class Selected extends HomeState {
  Selected(Price price) : super(price: price);
}

class Calculated extends HomeState {}

class HomeCubit extends Cubit<HomeState> with HomeControllers {
  HomeCubit(this._getCommonValuesUseCase) : super(Loading()) {
    _fetch();
  }

  final GetWeekCommonValuesUseCase _getCommonValuesUseCase;

  void _fetch() async {
    final values = await _getCommonValuesUseCase();

    totalCtrl.text = values?.totalCards.toString() ?? '';
    taxCtrl.text = values?.tax.toString() ?? '';
    allowanceCtrl.text = values?.allowance.toString() ?? '';

    emit(Fetched());
  }

  bool _validate() {
    return totalCtrl.text.isNotEmpty &&
        soldCtrl.text.isNotEmpty &&
        devCtrl.text.isNotEmpty &&
        missCtrl.text.isNotEmpty &&
        taxCtrl.text.isNotEmpty &&
        allowanceCtrl.text.isNotEmpty;
  }

  void _calculate() {
    print('calculate');
  }

  void changeSelected(Price price) {
    emit(Selected(price));

    if (_validate()) _calculate();
  }
}

abstract class HomeControllers {
  final totalFocus = FocusNode();
  final saleFocus = FocusNode();
  final devolutionFocus = FocusNode();
  final missingFocus = FocusNode();
  final moneyFocus = FocusNode();
  final depositFocus = FocusNode();
  final taxFocus = FocusNode();
  final allowanceFocus = FocusNode();
  final totalCtrl = TextEditingController();
  final soldCtrl = TextEditingController();
  final devCtrl = TextEditingController();
  final missCtrl = TextEditingController();
  final paidCtrl = TextEditingController();
  final depositCtrl = TextEditingController();
  final taxCtrl = TextEditingController();
  final allowanceCtrl = TextEditingController();
}
