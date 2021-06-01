import 'package:flutter/material.dart';

class AppDecoration {
  AppDecoration._(this.context);
  final BuildContext context;

  factory AppDecoration.of(BuildContext context) {
    return AppDecoration._(context);
  }

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
