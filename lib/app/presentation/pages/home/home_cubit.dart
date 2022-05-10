import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/domain/usecases/get_week_common_values_usecase.dart';

enum Price { none, ten, fifteen, twenty, twentyFive, thirty }

enum Situation { none, debt, credit }

abstract class HomeState {
  HomeState({this.price = Price.none, this.situation = Situation.none, this.debt});

  Price price;
  Situation situation;
  double? debt;
}

class Loading extends HomeState {}

class Fetched extends HomeState {}

class Selected extends HomeState {
  Selected(Price price) : super(price: price);
}

class Calculated extends HomeState {
  Calculated({
    required Price price,
    required Situation situation,
    required double debt,
  }) : super(price: price, situation: situation, debt: debt);
}

class HomeCubit extends Cubit<HomeState> with HomeControllers {
  HomeCubit(this._getCommonValuesUseCase) : super(Loading()) {
    _fetch();
  }

  final GetWeekCommonValuesUseCase _getCommonValuesUseCase;

  int? total;
  int? sold;
  int? devolution;
  int? missing;
  double paid = 0;
  double deposits = 0;
  double? tax;
  double? allowance;
  double? price;

  void _fetch() async {
    final values = await _getCommonValuesUseCase();

    totalCtrl.text = values?.totalCards.toString() ?? '';
    taxCtrl.text = values?.tax.toString() ?? '';
    allowanceCtrl.text = values?.allowance.toString() ?? '';

    emit(Fetched());
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
    try {
      total = int.tryParse(totalCtrl.text)!;
      sold = int.tryParse(soldCtrl.text)!;
      devolution = int.tryParse(devCtrl.text)!;
      missing = int.tryParse(missCtrl.text)!;
      tax = double.tryParse(taxCtrl.text)!;
      allowance = double.tryParse(allowanceCtrl.text)!;
      if (paidCtrl.text.isNotEmpty) paid = double.tryParse(paidCtrl.text)!;
      if (depositCtrl.text.isNotEmpty) deposits = double.tryParse(depositCtrl.text)!;

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

      if (total! < sold!) throw Exception();
      // if (sold + devolution > total) throw Exception();
      // if (sold + missing > total) throw Exception();
      // if (sold + devolution + missing > total)  throw Exception();
      // if (devolution + missing > total) throw Exception();

      return true;
    } catch (e) {
      rethrow;
    }
  }

  void _calculate() {
    print('calculate');

    if (!_validateFields()) throw Exception();

    double grossDebt = sold! * (price! * 0.82);
    double earnRate = price! * 0.08;
    double taxRate = tax! / 100;
    double taxDebt = (sold! * earnRate) * taxRate;
    double missingDebt = missing! > 0 ? missing! * price! : 0;

    double debt = grossDebt + missingDebt + taxDebt - paid - deposits - allowance!;

    Situation situation = debt > 0 ? Situation.debt : Situation.credit;

    emit(Calculated(price: state.price, debt: debt, situation: situation));
  }

  void changeSelected(Price price) {
    emit(Selected(price));

    if (_validateToCalculate()) _calculate();
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
