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
    if (_missing! > _total!) throw AppException('Faltas não pode ser maior que total de cartelas!');
    if (_sold! + _devolution! > _total!) {
      throw AppException('Venda mais devolução não pode ser maior que total de cartelas!');
    }
    if (_sold! + _missing! > _total!) {
      throw AppException('Venda mais faltas não pode ser maior que total de cartelas!');
    }

    return true;
  }
}
