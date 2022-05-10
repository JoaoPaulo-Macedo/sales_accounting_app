// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// // enum ThemeSwitch { auto, dark, light }

// class AppConfig {
//   AppConfig._();

//   static final AppConfig singleton = AppConfig._();

//   bool checkedStorage = false;
//   ValueNotifier<ThemeMode> themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

//   Brightness themeModeToBrightness(BuildContext context) {
//     switch (themeMode.value) {
//       case ThemeMode.light:
//         return Brightness.light;
//         break;
//       case ThemeMode.dark:
//         return Brightness.dark;
//         break;
//       default:
//         if (MediaQuery.of(context).platformBrightness == Brightness.light)
//           return Brightness.light;
//         else
//           return Brightness.dark;
//     }
//   }
// }
