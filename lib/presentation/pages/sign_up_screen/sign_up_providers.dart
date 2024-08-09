import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_providers.g.dart';

@riverpod
class EmailController extends _$EmailController {
  @override
  String build() => '';

  set email(String email) => state = email;
}

@riverpod
class PasswordController extends _$PasswordController {
  @override
  String build() => '';

  set password(String password) => state = password;
}

@riverpod
bool isSignUpButtonEnabled(IsSignUpButtonEnabledRef ref) {
  final email = ref.watch(emailControllerProvider);
  final password = ref.watch(passwordControllerProvider);
  return email.isNotEmpty && password.isNotEmpty;
}
