import 'package:askm/core/context_extensions.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SocialFormWidget extends StatelessWidget {
  const SocialFormWidget({
    super.key,
    this.onEmailPressed,
    this.onGooglePressed,
    required this.isEmailButtonEnabled,
    required this.isGoogleButtonEnabled,
  });

  final VoidCallback? onEmailPressed;
  final VoidCallback? onGooglePressed;
  final bool isGoogleButtonEnabled;
  final bool isEmailButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (onGooglePressed != null)
          ASKMElevatedButton.social(
            isEnabled: isGoogleButtonEnabled,
            onPressed: onGooglePressed!,
            text: context.s.continueWithGoogle,
            iconPath: Assets.images.googleIcon,
          ),
        const SizedBox(height: Spacings.L),
        if (onEmailPressed != null)
          ASKMElevatedButton.secondary(
            isEnabled: isEmailButtonEnabled,
            onPressed: onEmailPressed!,
            text: context.s.continueWithEmail,
          ),
      ],
    );
  }
}
