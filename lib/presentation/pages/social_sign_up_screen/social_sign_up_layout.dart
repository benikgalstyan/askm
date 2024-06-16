import 'package:askm/core/context_extensions.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/background_widget.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialSignUpLayout extends StatefulWidget {
  const SocialSignUpLayout({super.key});

  @override
  State<SocialSignUpLayout> createState() => _SocialSignUpLayoutState();
}

class _SocialSignUpLayoutState extends State<SocialSignUpLayout> {
  static const upperFlex = 5;
  final appLogo = SvgPicture.asset(Assets.images.logo);
  final googleIcon = SvgPicture.asset(Assets.images.googleIcon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: upperFlex),
              appLogo,
              Text(
                context.s.askm,
                style: const TextStyle(fontSize: Spacings.xxL),
              ),
              Text(
                context.s.whether,
                style: const TextStyle(fontSize: Spacings.L),
              ),
              Text(
                context.s.comfort,
                style: const TextStyle(fontSize: Spacings.L),
              ),
              const SizedBox(height: Spacings.xxxxL),
              CustomButton(
                onPressed: () {
                  // TODO(Benik): implement google sign up
                },
                icon: googleIcon,
                buttonColor: Colors.white,
                textButtonColor: Colors.black,
                text: context.s.continueWithGoogle,
              ),
              const SizedBox(
                height: Spacings.L,
              ),
              CustomButton(
                onPressed: () {
                  // TODO(Benik): implement email sign up
                },
                textButtonColor: Colors.white,
                text: context.s.continueWithEmail,
                buttonColor: const Color(0xFF292727),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
