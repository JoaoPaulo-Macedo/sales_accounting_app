import 'package:lucky_triangle/app/services/local_storage.dart';
import 'package:lucky_triangle/app/viewmodels/change_theme.dart';

class RootController {
  RootController._() {
    changeTheme.init();
  }

  /// A singleton allows you to access the same instace with the same state anywhere.
  /// By making the constructor private you prevent it from being initialized and stop being a singleton.
  /// By making instance as final you prevent it from being changed.
  static final RootController instance = RootController._(); //Singleton?
  // TODO: Question: Why make it a singleton?
  final changeTheme = ChangeThemeViewModel(LocalStorage());
}
