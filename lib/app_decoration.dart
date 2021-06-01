import 'package:flutter/material.dart';

class AppDecoration {
  AppDecoration._(this.context);
  final BuildContext context;

  factory AppDecoration.of(BuildContext context) => AppDecoration._(context);

  List<BoxShadow> get appShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(4, 4),
        )
      ];

  List<BoxShadow> get priceShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(0, 0),
        )
      ];

  BoxDecoration get appTextBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: appShadow,
      );

  BoxDecoration get appPriceBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: appShadow,
      );

  BoxDecoration get appDebtBoxDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: appShadow,
      );
}

class AppColors {
  AppColors._(this.context);
  final BuildContext context;

  factory AppColors.of(BuildContext context) => AppColors._(context);

  Color get greyColor => Colors.grey[700];
  Color get disabledColor => Colors.grey[100];
  Color get secondaryColor => Colors.red[900];
}
