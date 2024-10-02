import 'package:askm/data/models/errors/sign_up_exception.dart';
import 'package:askm/data/models/sign_in_result.dart';
import 'package:askm/data/models/sign_up_result.dart';
import 'package:askm/data/models/user.dart';
import 'package:askm/data/repository/repository.dart';
import 'package:askm/data/service/local_storage/local_storage_service.dart';
import 'package:askm/data/service/local_storage/secure_storage_service.dart';
import 'package:askm/data/service/network_service/network_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class RepositoryImpl implements Repository {
  RepositoryImpl({
    required this.secureStorage,
    required this.networkService,
    required this.localStorageService,
  });

  final LocalStorageService localStorageService;
  final NetworkService networkService;
  final SecureStorageService secureStorage;

  final firebaseAuth = auth.FirebaseAuth.instance;

  @override
  Future<SignUpResult> registerUser(String email, String password) async {
    SignUpException? error;
    String? accessToken;
    auth.UserCredential? credential;

    try {
      credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      accessToken = await credential.user?.getIdToken();

      if (accessToken != null) {
        await secureStorage.saveAccessToken(accessToken);
      }
      await localStorageService.saveUserInfo(email);
    } on auth.FirebaseAuthException catch (e) {
      error = SignUpException.fromFirebaseAuth(e);
    }

    User? user;
    if (credential != null) user = User(email);

    return SignUpResult(user, error, accessToken);
  }

  @override
  Future<SignInResult> signIn(String email, String password) async {
    SignUpException? error;
    auth.UserCredential? credential;

    try {
      credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on auth.FirebaseAuthException catch (e) {
      error = SignUpException.fromFirebaseAuth(e);
    }

    User? user;
    if (credential != null) user = User(email);

    return SignInResult(user, error);
  }
}
