import 'package:flutter/foundation.dart';

enum ThemeSwitch { auto, dark, light }

class AppConfig {

  ValueNotifier<ThemeSwitch> themeSwitch = ValueNotifier<ThemeSwitch>(ThemeSwitch.auto);

}