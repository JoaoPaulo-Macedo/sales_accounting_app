import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/domain/usecases/get_week_common_values_usecase.dart';
import 'package:lucky_triangle/app/presentation/pages/home/home_states.dart';

enum Price { none, ten, fifteen, twenty, twentyFive, thirty }

enum Situation { none, debt, credit }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getCommonValuesUseCase) : super(Loading()) {
    _init();
  }

  final GetWeekCommonValuesUseCase _getCommonValuesUseCase;

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

  int? total;
  int? sold;
  int? devolution;
  int? missing;
  double paid = 0;
  double deposits = 0;
  double? tax;
  double? allowance;
  double? price;

  void _init() async {
    final values = await _getCommonValuesUseCase();

    totalCtrl.text = values?.totalCards.toString() ?? '';
    taxCtrl.text = values?.tax.toString() ?? '';
    allowanceCtrl.text = values?.allowance.toString() ?? '';

    totalCtrl.addListener(() => _onType());
    soldCtrl.addListener(() {
      _onType();
      _autoGenerateMissingField();
    });
    devCtrl.addListener(() {
      _onType();
      _autoGenerateMissingField();
    });
    missCtrl.addListener(() => _missingListener());
    paidCtrl.addListener(() => _onType());
    depositCtrl.addListener(() => _onType());
    taxCtrl.addListener(() => _onType());
    allowanceCtrl.addListener(() => _onType());

    emit(Fetched());
  }

  void changeSelected(Price price) {
    emit(Selected(price));

    if (_validateToCalculate()) _calculate();
  }

  _onType() async {
    await Future.delayed(const Duration(milliseconds: 500));

    _calculate();
  }

  void _missingListener() {
    _onType();
    Color? missingColor = Colors.lightGreen;

    missing = int.tryParse(missCtrl.text) ?? 0;

    if (missing! > 0 && missing! <= 10) {
      missingColor = Colors.amber;
    } else if (missing! > 10) {
      missingColor = Colors.red;
    }

    emit(MissingChanged(price: state.price, missingColor: missingColor));
  }

  void _autoGenerateMissingField() async {
    await Future.delayed(const Duration(milliseconds: 500));

    total = int.tryParse(totalCtrl.text);
    sold = int.tryParse(soldCtrl.text);
    devolution = int.tryParse(devCtrl.text);
    missing = int.tryParse(missCtrl.text);

    if (total != null && sold != null && devolution != null) {
      var value = total! - (sold! + devolution!);
      if (value < 0) value = 0;

      missing = value;
      missCtrl.text = missing.toString();
    } else {
      missing = null;
      missCtrl.text = '';
    }
  }

  void _calculate() {
    try {
      if (state.price == Price.none) return;
      if (!_validateFields()) return;

      double grossDebt = sold! * (price! * 0.82);
      double earnRate = price! * 0.08;
      double taxRate = tax! / 100;
      double taxDebt = (sold! * earnRate) * taxRate;
      double missingDebt = missing! > 0 ? missing! * price! : 0;

      double debt = grossDebt + missingDebt + taxDebt - paid - deposits - allowance!;

      Situation situation = debt > 0 ? Situation.debt : Situation.credit;

      emit(Calculated(price: state.price, debt: debt, situation: situation));
    } on AppException catch (e) {
      print(e.message);
    } catch (e) {
      print('Erro inexperado');
    }
  }

  bool _validateToCalculate() {
    return totalCtrl.text.isNotEmpty &&
        soldCtrl.text.isNotEmpty &&
        devCtrl.text.isNotEmpty &&
        missCtrl.text.isNotEmpty &&
        taxCtrl.text.isNotEmpty &&
        allowanceCtrl.text.isNotEmpty;
  }

  bool _validateFields() {
    total = int.tryParse(totalCtrl.text)!;
    sold = int.tryParse(soldCtrl.text)!;
    devolution = int.tryParse(devCtrl.text)!;
    missing = int.tryParse(missCtrl.text)!;
    tax = double.tryParse(taxCtrl.text)!;
    allowance = double.tryParse(allowanceCtrl.text)!;

    if (paidCtrl.text.isNotEmpty) {
      paid = double.tryParse(paidCtrl.text)!;
    } else {
      paid = 0;
    }
    if (depositCtrl.text.isNotEmpty) {
      deposits = double.tryParse(depositCtrl.text)!;
    } else {
      deposits = 0;
    }

    switch (state.price) {
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

    if (sold! > total!) throw AppException('Venda não pode ser maior que total de cartelas!');
    if (devolution! > total!) throw AppException('Devolução não pode ser maior que total de cartelas!');
    if (sold! + devolution! > total!) {
      throw AppException('Venda mais devolução não pode ser maior que total de cartelas!');
    }
    // if (sold + missing > total) throw Exception();
    // if (sold! + devolution! + missing! > total!) throw AppException('Venda, devolução e faltas é maior que total de cartelas!');
    // if (devolution + missing > total) throw Exception();

    return true;
  }
}

class AppException {
  AppException(this.message);

  final String message;
}
