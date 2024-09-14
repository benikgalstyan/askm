import 'package:firebase_auth/firebase_auth.dart';

enum SignUpExceptionType {
  emailTaken,
  invalidEmail,
  noPermission,
  weakPassword,
}

class SignUpException {
  SignUpException(this.exception, this.details);

  factory SignUpException.emailTaken([details]) =>
      SignUpException(SignUpExceptionType.emailTaken, details);
  factory SignUpException.invalidEmail([details]) =>
      SignUpException(SignUpExceptionType.invalidEmail, details);
  factory SignUpException.noPermission([details]) =>
      SignUpException(SignUpExceptionType.noPermission, details);
  factory SignUpException.weakPassword([details]) =>
      SignUpException(SignUpExceptionType.weakPassword, details);

  final SignUpExceptionType exception;
  final dynamic details;

  static const _emailAlreadyInUseCode = 'email-already-in-use';
  static const _invalidEmailCode = 'invalid-email';
  static const _operationNotAllowedCOde = 'operation-not-allowed';
  static const _weakPassword = 'weak-password';

  static SignUpException fromFirebaseAuth(FirebaseAuthException exception) {
    if (exception.code == _emailAlreadyInUseCode) {
      return SignUpException.emailTaken();
    }
    if (exception.code == _invalidEmailCode) {
      return SignUpException.emailTaken();
    }
    if (exception.code == _operationNotAllowedCOde) {
      return SignUpException.emailTaken();
    }
    if (exception.code == _weakPassword) return SignUpException.emailTaken();
    throw Exception(
      'We are not processing this type of FirebaseAuthException $exception in fromFirebaseAuth method',
    );
  }
}

extension FirebaseAuthConstructror on SignUpException {}
