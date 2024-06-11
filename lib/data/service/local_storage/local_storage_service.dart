import 'package:askm/data/models/user.dart';

abstract class LocalStorageService {
  Future<void> saveUserData(User user);
}
