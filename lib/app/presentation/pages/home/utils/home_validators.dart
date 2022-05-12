part of '../home_cubit.dart';

extension HomeValidators on HomeCubit {
  bool _validateToCalculate() {
    return totalCtrl.text.isNotEmpty &&
        soldCtrl.text.isNotEmpty &&
        devCtrl.text.isNotEmpty &&
        missCtrl.text.isNotEmpty &&
        taxCtrl.text.isNotEmpty &&
        allowanceCtrl.text.isNotEmpty;
  }

  bool _validateFields() {
    // total = int.tryParse(totalCtrl.text)!;
    // sold = int.tryParse(soldCtrl.text)!;
    // devolution = int.tryParse(devCtrl.text)!;
    // missing = int.tryParse(missCtrl.text)!;
    // tax = double.tryParse(taxCtrl.text)!;
    // allowance = double.tryParse(allowanceCtrl.text)!;

    // if (paidCtrl.text.isNotEmpty) {
    //   paid = double.tryParse(paidCtrl.text)!;
    // } else {
    //   paid = 0;
    // }
    // if (depositCtrl.text.isNotEmpty) {
    //   deposits = double.tryParse(depositCtrl.text)!;
    // } else {
    //   deposits = 0;
    // }

    switch (state.price) {
      case Price.ten:
        _price = 10;
        break;
      case Price.fifteen:
        _price = 15;
        break;
      case Price.twenty:
        _price = 20;
        break;
      case Price.twentyFive:
        _price = 25;
        break;
      case Price.thirty:
        _price = 30;
        break;
      case Price.none:
        throw Exception();
    }

    if (_sold! > _total!) throw AppException('Venda não pode ser maior que total de cartelas!');
    if (_devolution! > _total!) throw AppException('Devolução não pode ser maior que total de cartelas!');
    if (_sold! + _devolution! > _total!) {
      throw AppException('Venda mais devolução não pode ser maior que total de cartelas!');
    }
    // if (sold + missing > total) throw Exception();
    // if (sold! + devolution! + missing! > total!) throw AppException('Venda, devolução e faltas é maior que total de cartelas!');
    // if (devolution + missing > total) throw Exception();

    return true;
  }
}
