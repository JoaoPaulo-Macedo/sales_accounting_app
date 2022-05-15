import 'package:flutter/material.dart';
import 'package:reckoning/app/presentation/pages/initial/app_initial_widget.dart';
import 'package:reckoning/core/inject/inject.dart';

void main() {
  Inject.init();

  runApp(const AppInitialWidget());
}
