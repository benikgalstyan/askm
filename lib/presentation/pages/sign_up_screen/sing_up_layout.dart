import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpLayout extends StatefulWidget {
  const SignUpLayout({super.key});

  @override
  State<SignUpLayout> createState() => _SignUpLayoutState();
}

class _SignUpLayoutState extends State<SignUpLayout> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: Spacings.paddingH20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacings.spacer64,
              Text(context.s.createAccount, style: TextStyles.headline2),
              Spacings.spacer32,
              SignUpForm(
                onSignUpButtonPressed: (String email, String password) {
                  // TODO(Benik): Implement sign up button
                },
              ),
              Spacings.spacer48,
            ],
          ),
        ),
      ),
    );
  }
}
