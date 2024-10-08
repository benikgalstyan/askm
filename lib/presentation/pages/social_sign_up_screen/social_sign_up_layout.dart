import 'package:askm/core/context_extensions.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/pages/sign_up_screen/sign_up_screen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/app_logo.dart';
import 'package:askm/presentation/widgets/background_widget.dart';
import 'package:askm/presentation/widgets/social_auth_form_widget.dart';
import 'package:flutter/material.dart';

class SocialSignUpLayout extends StatelessWidget {
  const SocialSignUpLayout({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BackgroundWidget(
          backgroundImage: Assets.images.backgroundImage.path,
          child: Column(
            children: [
              const Spacer(),
              AppLogo(
                description: context.s
                    .whether_you_re_on_the_go_or_in_the_comfort_of_your_own_space,
              ),
              const SizedBox(height: Spacings.xxxxL),
              SocialAuthFormWidget(
                onGooglePressed: () {
                  // TODO(Benik): Implement Google sign-up logic
                },
                onEmailPressed: () => context.r.pushNamed(SignUpScreen.nameRoute),
              ),
              Spacings.spacer32,
            ],
          ),
        ),
      );
}
