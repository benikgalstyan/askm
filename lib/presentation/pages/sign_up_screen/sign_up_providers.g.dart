// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isSignUpButtonEnabledHash() =>
    r'dd2ce05ff02c05279cca5e6ddfd2806df9c9f6e3';

/// See also [isSignUpButtonEnabled].
@ProviderFor(isSignUpButtonEnabled)
final isSignUpButtonEnabledProvider = AutoDisposeProvider<bool>.internal(
  isSignUpButtonEnabled,
  name: r'isSignUpButtonEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isSignUpButtonEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsSignUpButtonEnabledRef = AutoDisposeProviderRef<bool>;
String _$emailControllerHash() => r'14f871e5c9279f500bd25fa27b9e3100485c59cc';

/// See also [EmailController].
@ProviderFor(EmailController)
final emailControllerProvider =
    AutoDisposeNotifierProvider<EmailController, String>.internal(
  EmailController.new,
  name: r'emailControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$emailControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EmailController = AutoDisposeNotifier<String>;
String _$passwordControllerHash() =>
    r'15b95ef89f5773e4618cab448c08ea86fd757d35';

/// See also [PasswordController].
@ProviderFor(PasswordController)
final passwordControllerProvider =
    AutoDisposeNotifierProvider<PasswordController, String>.internal(
  PasswordController.new,
  name: r'passwordControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PasswordController = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
