import 'package:askm/core/context_extensions.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/app_logo.dart';
import 'package:askm/presentation/widgets/background_widget.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:askm/presentation/widgets/info_widget.dart';
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
              const AppLogo(),
              const InfoTextsWidget(),
              const SizedBox(height: Spacings.xxxxL),
              ASKMElevatedButton.social(
                onPressed: () {
                  // TODO(Benik): implement google sign up
                },
                text: context.s.continueWithGoogle,
              ),
              const SizedBox(height: Spacings.L),
              ASKMElevatedButton.primary(
                onPressed: () {
                  // TODO(George): implement email sign up
                },
                text: context.s.continueWithEmail,
                isEnabled: false,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
