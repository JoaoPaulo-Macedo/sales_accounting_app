abstract class LocalDataService {
  Future<String?> getString(String key);

  Future<List<String>?> getStringList(String key);

  Future<bool> setString(String key, String value);

  Future<bool> setStringList(String key, List<String> value);

  Future<bool> remove(String key);

  Future<bool> clear();
}
