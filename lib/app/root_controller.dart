import 'package:lucky_triangle/app/services/local_storage.dart';
import 'package:lucky_triangle/app/viewmodels/theme_viewmodel.dart';

class RootController {
  RootController._() {
    themeController.init();
  }

  final RootController? controller;

  factory RootController() {
    if (controller == null) controller = RootController._();
    return controller!;
  }

  /// A singleton allows you to access the same instace with the same state anywhere.
  /// By making the constructor private you prevent it from being initialized and stop being a singleton.
  /// By making instance as final you prevent it from being changed.
  // static final RootController instance = RootController._();

  final themeController = ThemeViewModel(LocalStorage());
}
