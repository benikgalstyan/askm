import 'package:askm/data/models/user.dart';
import 'package:askm/data/models/errors/sign_up_exception.dart';

class SignInResult {
  SignInResult(this.user, this.error, this.accessToken);

  final User? user;
  final String? accessToken;
  final SignUpException? error;

  bool get success => user != null;
}
