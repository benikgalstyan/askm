import 'package:askm/data/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:askm/data/service/local_storage/local_storage_service.dart';

class SharedPrefsStorageService implements LocalStorageService {
  static const String _userKey = 'user';

  @override
  Future<void> saveUserData(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userData = jsonEncode(user.toMap());
    await prefs.setString(_userKey, userData);
  }
}
