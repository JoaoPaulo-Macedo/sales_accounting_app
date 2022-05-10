import 'package:flutter/material.dart';

class AppColors {
  AppColors._(this.context);
  final BuildContext context;

  factory AppColors.of(BuildContext context) => AppColors._(context);

  bool get isDarkMode => Theme.of(context).brightness == Brightness.dark;

  Color? get redColor => isDarkMode ? Colors.red : Colors.red[900];
  Color? get textColor => isDarkMode ? Colors.grey[300] : Colors.grey[700];
  Color get cardColor => isDarkMode ? Color.fromARGB(255, 43, 40, 46) : Colors.white;
  Color get priceCardColor => isDarkMode ? Color.fromARGB(255, 51, 48, 54) : Colors.white;
  Color? get disabledColor => isDarkMode ? Color.fromARGB(255, 48, 45, 51) : Colors.grey[100];
  Color get loadingScreen => Colors.blueGrey;
}

class AppDecoration {
  AppDecoration._(this.context);
  final BuildContext context;

  factory AppDecoration.of(BuildContext context) => AppDecoration._(context);

  AppColors get appColors => AppColors.of(context);
  bool get isDarkMode => Theme.of(context).brightness == Brightness.dark;

  List<BoxShadow> get appShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 0,
          blurRadius: 5,
          offset: Offset(4, 4),
        )
      ];

  List<BoxShadow>? get priceShadow => isDarkMode
      ? null
      : [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
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

class AppSizes {
  AppSizes._();

  static final AppSizes singleton = AppSizes._();

  final double smallSpacing = 6;
  final double bigSpacing = 17;
  final double fontSize = 18;
  final double iconSize = 25;
  final double cardHeight = 68;
  final EdgeInsets cardPadding = const EdgeInsets.fromLTRB(5, 5, 0, 5);
}
