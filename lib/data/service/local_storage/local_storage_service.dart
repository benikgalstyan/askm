abstract interface class LocalStorageService {
  Future<bool> setBool(String key, bool value);

  Future<bool> getBool(String key, bool defaultValue);

  Future<bool> setInt(String key, int value);

  Future<int> getInt(String key, int defaultValue);

  Future<bool> setString(String key, int value);

  Future<String> getString(String key, String defaultValue);
}