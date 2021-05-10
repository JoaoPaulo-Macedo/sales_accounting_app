import 'package:flutter/material.dart';

class AppDecoration {
  static List<BoxShadow> appShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 0,
      blurRadius: 5,
      offset: Offset(4, 4),
    )
  ];

  static List<BoxShadow> priceShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 0,
      blurRadius: 5,
      offset: Offset(4, 4),
    )
  ];

  static BoxDecoration appTextBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: appShadow,
  );

  static BoxDecoration appPriceBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: appShadow,
  );

  static BoxDecoration appDebtBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(100),
    boxShadow: appShadow,
  );
}
