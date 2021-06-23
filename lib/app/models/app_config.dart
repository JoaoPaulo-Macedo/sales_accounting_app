import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucky_triangle/app/services/local_storage.dart';

// enum ThemeSwitch { auto, dark, light }

class AppConfig {
  AppConfig._();

  static final AppConfig singleton = AppConfig._();

  ValueNotifier<ThemeMode> get themeMode => ValueNotifier<ThemeMode>(ThemeMode.system);
}
