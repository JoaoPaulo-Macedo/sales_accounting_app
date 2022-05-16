abstract class LocalDataService {
  Future<String?> getString(String key);

  Future<bool> setString(String key, String value);

  Future<bool> remove(String key);

  Future<bool> clear();
}
