import 'package:askm/data/repository/repository_impl.dart';
import 'package:askm/data/service/local_storage/secure_storage_service.dart';
import 'package:askm/data/service/local_storage/shared_pref_storage_service.dart';
import 'package:askm/data/service/network_service/dio_network_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:askm/data/models/sign_up_result.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late final RepositoryImpl authRepository;
  final localeStorage = SharedPrefsStorageService();
  final networkService = DioNetworkServiceImpl(Dio());
  final secureStorage = SecureStorageService();

  @override
  SignUpResult? build() {
    authRepository = RepositoryImpl(
      secureStorage: secureStorage,
      networkService: networkService,
      localStorageService: localeStorage,
    );
    return null;
  }

  Future<bool> signUp(String email, String password) async {
    final result = await authRepository.registerUser(email, password);

    if (result.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    final result = await authRepository.signIn(email, password);

    if (result.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    await secureStorage.deleteAccessToken();
    await localeStorage.clearUserInfo();
  }
}
