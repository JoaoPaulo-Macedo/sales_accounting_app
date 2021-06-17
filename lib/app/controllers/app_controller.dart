import 'package:flutter/foundation.dart';

enum ThemeSwitch { auto, dark, light }

class AppController {
  AppController._();

  /// A singleton allows you to access the same instace with the same state anywhere.
  /// By making the constructor private you prevent it from being initialized and stop being a singleton.
  /// By making instance as final you prevent it from being changed.
  static final AppController instance = AppController._(); //Singleton?

  final themeSwitch = ValueNotifier<ThemeSwitch>(ThemeSwitch.auto);

  changeTheme() {
    ThemeSwitch value;

    switch (themeSwitch.value) {
      case ThemeSwitch.auto:
        value = ThemeSwitch.light;
        break;
      case ThemeSwitch.light:
        value = ThemeSwitch.dark;
        break;
      case ThemeSwitch.dark:
        value = ThemeSwitch.auto;
        break;
    }

    themeSwitch.value = value;
  }
}
