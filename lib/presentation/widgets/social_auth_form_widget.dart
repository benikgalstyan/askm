import 'package:askm/core/context_extensions.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

enum AuthMethods {
  email,
  google,
}

class SocialAuthFormWidget extends StatelessWidget {
  const SocialAuthFormWidget({
    super.key,
    this.onEmailPressed,
    this.onGooglePressed,
    required this.isEmailButtonEnabled,
    required this.isGoogleButtonEnabled,
  });

  final bool isGoogleButtonEnabled;
  final bool isEmailButtonEnabled;

  final VoidCallback? onEmailPressed;
  final VoidCallback? onGooglePressed;

  static const _noAuthPlug = SizedBox.shrink();
  static const _defaultTopPadding = EdgeInsets.only(top: 16);

  bool get isGoogleAuthEnabled => onGooglePressed != null;

  bool get isEmailAuthEnabled => onEmailPressed != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AuthMethods.values.map((method) {
        switch (method) {
          case AuthMethods.google:
            if (isGoogleAuthEnabled) {
              return Padding(
                padding: _defaultTopPadding,
                child: ASKMElevatedButton.social(
                  isEnabled: isGoogleButtonEnabled,
                  onPressed: onGooglePressed!,
                  text: context.s.continueWithGoogle,
                  iconPath: Assets.images.googleIcon,
                ),
              );
            }
          case AuthMethods.email:
            if (isEmailAuthEnabled) {
              return ASKMElevatedButton.secondary(
                isEnabled: isEmailButtonEnabled,
                onPressed: onEmailPressed!,
                text: context.s.continueWithEmail,
              );
            }
        }
        return _noAuthPlug;
      }).toList(),
    );
  }
}
