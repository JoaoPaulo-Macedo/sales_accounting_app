import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/models/app_config.dart';
import 'package:lucky_triangle/app/services/local_storage.dart';

class ThemeViewModel {
  /// "Storage" variable is a dependency injected by constructor, instead of instantiated inside the class.
  ThemeViewModel(this.storage);

  final LocalStorage storage;
  ValueNotifier<ThemeMode> theme = AppConfig.singleton.themeMode;

  Future init() async {
    await storage.get('theme').then(
      (value) {
        if (value != null) {
          ThemeMode configTheme;
          switch (value) {
            case 'ThemeMode.system':
              configTheme = ThemeMode.system;
              break;
            case 'ThemeMode.light':
              configTheme = ThemeMode.light;
              break;
            case 'ThemeMode.dark':
              configTheme = ThemeMode.dark;
              break;
            default:
              configTheme = ThemeMode.system;
              print("Throw error"); //TODO: Throw error.
              break;
          }
          theme.value = configTheme;
          //TODO: The auto theme is being set before verifing the local storage...
        }
      },
    );
  }

  void changeTheme() {
    ThemeMode value;

    if (theme.value == ThemeMode.system) value = ThemeMode.light;
    else if (theme.value == ThemeMode.light) value = ThemeMode.dark;
    else if (theme.value == ThemeMode.dark) value = ThemeMode.system;
    else {
      value = ThemeMode.system;
      print("Throw error"); //Throw error.
    }

    theme.value = value;
    storage.put('theme', value);
  }
}
