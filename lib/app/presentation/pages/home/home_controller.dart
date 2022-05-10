import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/domain/usecases/get_week_common_values_usecase.dart';

enum Selected { none, ten, fifteen, twenty, twentyFive, thirty }

abstract class HomeState {}

class Loading extends HomeState {}

class Fetched extends HomeState {}

class Calculated extends HomeState {}

class HomeController extends Cubit<HomeState> with HomeHelper {
  HomeController(this._getCommonValuesUseCase) : super(Loading()) {
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
}

class HomeHelper {
  double debt = 0;
  Selected selected = Selected.none;
  String errorMessage = 'Informe o "Total de Cartelas" e a "Venda"';
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
