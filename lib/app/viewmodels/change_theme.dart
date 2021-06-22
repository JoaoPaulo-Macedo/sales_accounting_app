import 'package:flutter/foundation.dart';
import 'package:lucky_triangle/app/models/app_config.dart';
import 'package:lucky_triangle/app/services/local_storage.dart';

class ChangeThemeViewModel {
  /// "Storage" variable is a dependency injected by constructor, instead of instantiated inside the class.
  ChangeThemeViewModel(this.storage);

  final LocalStorage storage;
  final AppConfig config = AppConfig();
  ValueNotifier<ThemeSwitch> get theme => config.themeSwitch;

  Future init() async {
    print('Default Theme: ${config.themeSwitch.value}');
    await storage.get('theme').then(
      (value) {
        if (value != null) {
          ThemeSwitch configTheme;
          switch (value) {
            case 'ThemeSwitch.auto':
              configTheme = ThemeSwitch.auto;
              break;
            case 'ThemeSwitch.light':
              configTheme = ThemeSwitch.light;
              break;
            case 'ThemeSwitch.dark':
              configTheme = ThemeSwitch.dark;
              break;
          }
          config.themeSwitch.value = configTheme;
          print('Storage Theme: $value');
          //TODO: The auto theme is being set before verifing the local storage...
        }
      },
    );
  }

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
    storage.put('theme', value);
    print('Changed to: $value');
  }
}
