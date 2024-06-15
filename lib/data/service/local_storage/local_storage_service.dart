import 'package:askm/data/models/user.dart';

abstract class LocalStorageService {
  Future<User?> getUserData();

  Future<void> saveUserData(User user);
}
