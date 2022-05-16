// ignore_for_file: prefer_final_fields

part of '../home_cubit.dart';

class HomeProperties {
  bool _blockAutoGenerate = false;

  late WeekCommonValuesEntity commonValues;
  final raffle = RaffleWeekEntity(sold: null, devolution: null, missing: null, price: Price.none);

  ReckoningEntity reckoning = ReckoningEntity(
    money: 0,
    deposits: 0,
    debt: 0,
    situation: Situation.none,
  );

  /// Notifies when one of the common values fields are typed in order to controll data saving.
  ValueNotifier<bool> _commonsTyped = ValueNotifier<bool>(false);

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
