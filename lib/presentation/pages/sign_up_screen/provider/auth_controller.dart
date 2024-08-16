import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:askm/data/models/errors/sign_up_exception.dart';
import 'package:askm/data/models/sign_up_result.dart';
import 'package:askm/data/models/user.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  final auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

  @override
  SignUpResult? build() => null;

  Future<SignUpResult> signUp(String email, String password) async {
    SignUpException? error;
    String? accessToken;
    auth.UserCredential? credential;

    try {
      credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      accessToken = await credential.user?.getIdToken();
    } on auth.FirebaseAuthException catch (e) {
      error = SignUpException.fromFirebaseAuth(e);
    }

    User? user;
    if (credential != null) user = User(email);
    return SignUpResult(user, error, accessToken);
  }
}
