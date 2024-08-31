import 'package:askm/presentation/pages/sign_up_screen/provider/auth_controller.dart';
import 'package:askm/presentation/pages/sign_up_screen/provider/button_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/sign_up_form.dart';
import 'package:askm/presentation/pages/main_screen/main_screen.dart';

class SignUpLayout extends ConsumerWidget {
  const SignUpLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonEnabled = ref.watch(isSignUpButtonEnabledProvider);

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
                onSignUpButtonPressed: (String email, String password) async {
                  if (isButtonEnabled) {
                    final success = await ref
                        .read(authControllerProvider.notifier)
                        .signUp(email, password);

                    if (success) {
                      await context.r.pushNamed(MainScreen.nameRoute);
                    } else {
                      // TODO(Benik): Implement error screen
                      const Text('Error');
                    }
                  }
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
