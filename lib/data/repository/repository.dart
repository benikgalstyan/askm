import 'package:askm/data/models/facts.dart';
import 'package:askm/data/models/sign_up_result.dart';

abstract interface class Repository {
  Future<Facts> getFacts();
  Future<SignUpResult> registerUser(String email, String password);
}
