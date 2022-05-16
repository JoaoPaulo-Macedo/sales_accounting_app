part of '../home_cubit.dart';

extension HomeValidators on HomeCubit {
  bool _validateToCalculate() {
    return totalCtrl.text.isNotEmpty &&
        soldCtrl.text.isNotEmpty &&
        devCtrl.text.isNotEmpty &&
        missCtrl.text.isNotEmpty &&
        taxCtrl.text.isNotEmpty &&
        allowanceCtrl.text.isNotEmpty &&
        raffle.price != Price.none;
  }
}
