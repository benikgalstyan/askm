import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:askm/data/models/user.dart';
import 'package:askm/data/service/local_storage/local_storage_service.dart';

class SharedPrefsStorageService implements LocalStorageService {

  @override
  Future<void> saveUserInfo(String email, String? otherData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
    if (otherData != null) {
      await prefs.setString('otherData', otherData);
    }
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }


}
