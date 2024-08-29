import 'package:askm/data/models/user.dart';

abstract class LocalStorageService {
  Future<String?> getUserEmail();

  Future<void> saveUserInfo(String email, String? otherData);
}
