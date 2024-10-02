import 'package:askm/data/models/sign_in_result.dart';
import 'package:askm/data/models/sign_up_result.dart';

abstract interface class Repository {
  Future<SignUpResult> registerUser(String email, String password);

  Future<SignInResult> signIn(String email, String password);
}
