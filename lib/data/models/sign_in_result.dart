import 'package:askm/data/models/user.dart';
import 'package:askm/data/models/errors/sign_up_exception.dart';

class SignInResult {
  SignInResult(this.user, this.error);

  final User? user;
  final SignUpException? error;

  bool get success => user != null;
}
