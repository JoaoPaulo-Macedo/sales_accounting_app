import 'package:flutter/material.dart';
import 'package:sales_accounting/app/presentation/pages/initial/app_initial_widget.dart';
import 'package:sales_accounting/core/inject/inject.dart';

void main() {
  Inject.init();

  runApp(const AppInitialWidget());
}
