abstract class LocalStorageService {
  Future<String?> getUserEmail();

  Future<void> saveUserInfo(String email);
}
