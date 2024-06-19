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
    this.isEmailButtonEnabled,
    this.isGoogleButtonEnabled,
  });

  final bool? isGoogleButtonEnabled;
  final bool? isEmailButtonEnabled;

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
                  onPressed: onGooglePressed!,
                  text: context.s.continue_with_google,
                  iconPath: Assets.images.googleIcon,
                  isEnabled: isGoogleButtonEnabled ?? true,
                ),
              );
            }
          case AuthMethods.email:
            if (isEmailAuthEnabled) {
              return ASKMElevatedButton.secondary(
                onPressed: onEmailPressed!,
                text: context.s.continue_with_email,
                isEnabled: isEmailButtonEnabled ?? true,
              );
            }
        }
        return _noAuthPlug;
      }).toList(),
    );
  }
}
