import 'package:flutter/material.dart';

class AppDecoration {
  AppDecoration._(this.context);
  final BuildContext context;

  factory AppDecoration.of(BuildContext context) => AppDecoration._(context);

  AppColors get appColors => AppColors.of(context);
  bool get isDarkMode =>
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  List<BoxShadow> get appShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(4, 4),
        )
      ];

  List<BoxShadow> get priceShadow => isDarkMode
    ? null
    : [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 0,
        blurRadius: 5,
        offset: Offset(0, 0),
      )
    ];

  BoxDecoration get appTextBoxDecoration => BoxDecoration(
        color: appColors.cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: isDarkMode ? null : appShadow,
      );

  BoxDecoration get appPriceBoxDecoration => BoxDecoration(
        color: appColors.cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: isDarkMode ? null : priceShadow,
      );

  BoxDecoration get appDebtBoxDecoration => BoxDecoration(
        color: appColors.cardColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: isDarkMode ? null : appShadow,
      );
}

class AppColors {
  AppColors._(this.context);
  final BuildContext context;

  factory AppColors.of(BuildContext context) => AppColors._(context);

  bool get isDarkMode =>
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  Color get priceCardColor => isDarkMode ? Color.fromARGB(255, 51, 48, 54) : Colors.white;
  Color get greyColor => isDarkMode ? Colors.grey[300] : Colors.grey[700];
  Color get secondaryColor => isDarkMode ? Colors.red : Colors.red[900];
  Color get cardColor => isDarkMode ? Color.fromARGB(255, 43, 40, 46) : Colors.white;
  Color get disabledColor => isDarkMode ? Color.fromARGB(255, 48, 45, 51) : Colors.grey[100];
}
