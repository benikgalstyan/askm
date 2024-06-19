import 'package:askm/core/context_extensions.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/app_logo.dart';
import 'package:askm/presentation/widgets/background_widget.dart';
import 'package:askm/presentation/widgets/social_auth_form_widget.dart';
import 'package:flutter/material.dart';

class SocialSignUpLayout extends StatefulWidget {
  const SocialSignUpLayout({super.key});

  @override
  State<SocialSignUpLayout> createState() => _SocialSignUpLayoutState();
}

class _SocialSignUpLayoutState extends State<SocialSignUpLayout> {
  static const upperFlex = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        backgroundImage: Assets.images.backgroundImage.keyName,
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: upperFlex),
              AppLogo(
                description: [
                  context.s.whether,
                  context.s.comfort,
                ],
              ),
              const SizedBox(height: Spacings.xxxxL),
              SocialAuthFormWidget(
                onGooglePressed: () {
                  // TODO(Benik): Implement Google sign-up logic
                },
                onEmailPressed: () {
                  // TODO(Benik): Implement email sign-up logic
                },
                isEmailButtonEnabled: true,
                isGoogleButtonEnabled: true,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
