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
  });

  final VoidCallback? onEmailPressed;
  final VoidCallback? onGooglePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (onGooglePressed != null)
          ASKMElevatedButton.social(
            isEnabled: true,
            onPressed: onGooglePressed!,
            text: context.s.continueWithGoogle,
            iconPath: Assets.images.googleIcon,
          ),
        const SizedBox(height: Spacings.L),
        if (onEmailPressed != null)
          ASKMElevatedButton.secondary(
            isEnabled: true,
            onPressed: onEmailPressed!,
            text: context.s.continueWithEmail,
          ),
      ],
    );
  }
}
