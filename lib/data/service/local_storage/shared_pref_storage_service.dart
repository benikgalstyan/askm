import 'package:shared_preferences/shared_preferences.dart';
import 'package:askm/data/service/local_storage/local_storage_service.dart';

class SharedPrefsStorageService implements LocalStorageService {
  @override
  Future<void> saveUserInfo(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
  }

  @override
  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  @override
  Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userEmail');
  }
}
