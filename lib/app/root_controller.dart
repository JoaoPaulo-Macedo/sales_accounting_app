import 'package:flutter/foundation.dart';

import 'models/app_config.dart';

class RootController {
  RootController._();

  /// A singleton allows you to access the same instace with the same state anywhere.
  /// By making the constructor private you prevent it from being initialized and stop being a singleton.
  /// By making instance as final you prevent it from being changed.
  static final RootController instance = RootController._(); //Singleton?

  final AppConfig config = AppConfig();
  ValueNotifier<ThemeSwitch> get theme => config.themeSwitch;

  changeTheme() {
    ThemeSwitch value;

    switch (theme.value) {
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

    theme.value = value;
  }
}
