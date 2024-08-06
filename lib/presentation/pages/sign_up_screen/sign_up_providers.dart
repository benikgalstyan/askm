import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider((ref) => '');
final passwordProvider = StateProvider((ref) => '');

final isButtonEnabledProvider = Provider((ref) {
  final email = ref.watch(emailProvider);
  final password = ref.watch(passwordProvider);
  return email.isNotEmpty && password.isNotEmpty;
});
