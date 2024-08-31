import 'package:askm/data/models/errors/sign_up_exception.dart';
import 'package:askm/data/models/user.dart';

class SignUpResult {
  SignUpResult(this.user, this.error, this.accessToken);

  final User? user;
  final SignUpException? error;
  final String? accessToken;

  bool get success => user != null && error == null;
}
