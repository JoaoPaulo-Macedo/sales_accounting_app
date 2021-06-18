import 'package:flutter/foundation.dart';
import 'package:lucky_triangle/app/interfaces/local_storage_interface.dart';
import 'package:lucky_triangle/app/services/local_storage.dart';

import 'models/app_config.dart';

class RootController {
  RootController._() {
    print('ROOOOOOOT!!!!!!!!!!!!');
    print('${theme.value}?????????????????');
    storage.get('theme').then((value) {
      print('STORAGE!!!!!!!!!!!!');
      if (value != null) {
        var theme;
        switch (value) {
          case "ThemeSwitch.auto":
            theme = ThemeSwitch.auto;
            break;
          case 'ThemeSwitch.light':
            theme = ThemeSwitch.light;
            break;
          case 'ThemeSwitch.dark':
            theme = ThemeSwitch.dark;
            break;
        }
        config.themeSwitch.value = theme;
        print('STORAGE??????????????');
        print('$value?????????????');
        //TODO: The auto theme is being set before verifing the local storage...
      }
    });
  }

  /// A singleton allows you to access the same instace with the same state anywhere.
  /// By making the constructor private you prevent it from being initialized and stop being a singleton.
  /// By making instance as final you prevent it from being changed.
  static final RootController instance = RootController._(); //Singleton?

  final AppConfig config = AppConfig();
  ValueNotifier<ThemeSwitch> get theme => config.themeSwitch;

  /// Always set the variable as the interface an then instantiate some interface's implementation.
  final LocalStorageInterface storage = LocalStorage();

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
    print('$value!!!!!!!!!!!!!!!!!!!!!');
    storage.put('theme', value);
  }
}
