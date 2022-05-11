import 'package:lucky_triangle/core/domain/services/local_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServiceImp extends LocalDataService {
  static SharedPreferences? _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<String?> getString(String key) async {
    if (_prefs == null) await init();

    String? data = _prefs!.getString(key);

    return data;
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    if (_prefs == null) await init();

    List<String>? data = _prefs!.getStringList(key);

    return data;
  }

  @override
  Future<bool> setString(String key, String value) async {
    if (_prefs == null) await init();

    return await _prefs!.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    if (_prefs == null) await init();

    return await _prefs!.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key) async {
    if (_prefs == null) await init();

    return await _prefs!.remove(key);
  }

  @override
  Future<bool> clear() async {
    if (_prefs == null) await init();

    return await _prefs!.clear();
  }
}
