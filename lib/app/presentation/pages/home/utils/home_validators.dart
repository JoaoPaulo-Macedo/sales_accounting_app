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
        raffle.price = 10;
        break;
      case Price.fifteen:
        raffle.price = 15;
        break;
      case Price.twenty:
        raffle.price = 20;
        break;
      case Price.twentyFive:
        raffle.price = 25;
        break;
      case Price.thirty:
        raffle.price = 30;
        break;
      case Price.none:
        throw Exception();
    }

    if (raffle.sold! > commonValues.totalCards!) throw AppException('Venda não pode ser maior que total de cartelas!');
    if (raffle.devolution! > commonValues.totalCards!) throw AppException('Devolução não pode ser maior que total de cartelas!');
    if (raffle.missing! > commonValues.totalCards!) throw AppException('Faltas não pode ser maior que total de cartelas!');
    if (raffle.sold! + raffle.devolution! > commonValues.totalCards!) {
      throw AppException('Venda mais devolução não pode ser maior que total de cartelas!');
    }
    if (raffle.sold! + raffle.missing! > commonValues.totalCards!) {
      throw AppException('Venda mais faltas não pode ser maior que total de cartelas!');
    }

    return true;
  }
}
