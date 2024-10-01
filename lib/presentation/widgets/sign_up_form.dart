import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/templates/form_validators.dart';
import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/pages/sign_in_screen/sign_in_screen.dart';
import 'package:askm/presentation/pages/sign_up_screen/provider/button_controller.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:askm/presentation/widgets/input_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({
    super.key,
    this.onSignInButtonPressed,
    this.onSignUpButtonPressed,
    required this.isSignUp,
  });

  final void Function(String email, String password)? onSignUpButtonPressed;
  final void Function(String email, String password)? onSignInButtonPressed;

  final bool isSignUp;

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  static const spacer = SizedBox(height: 32);
  static const paddingTopLeft = EdgeInsets.only(top: 8, left: 12);

  @override
  void initState() {
    super.initState();
    _pass.addListener(_updatePassword);
    _email.addListener(_updateEmail);
  }

  @override
  void dispose() {
    _pass.dispose();
    _email.dispose();
    super.dispose();
    _pass.removeListener(_updatePassword);
    _email.removeListener(_updateEmail);
  }

  void _updateEmail() {
    ref.read(emailControllerProvider.notifier).email = _email.text;
  }

  void _updatePassword() {
    ref.read(passwordControllerProvider.notifier).password = _pass.text;
  }

  @override
  Widget build(BuildContext context) {
    final isButtonEnabled = ref.watch(isSignUpButtonEnabledProvider);
    return Form(
      key: formKey,
      child: Expanded(
        child: Column(
          children: [
            InputFieldWidget(
              controller: _email,
              labelText: context.s.email,
              validator: FormValidators.emailValidator,
            ),
            spacer,
            InputFieldWidget(
              controller: _pass,
              labelText: context.s.password,
              validator: widget.isSignUp
                  ? FormValidators.passwordRegValidator
                  : FormValidators.passwordValidator,
            ),
            Padding(
              padding: paddingTopLeft,
              child: Row(
                children: [
                  widget.isSignUp
                      ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: TextStyles.hintText1,
                                text: context.s.alreadyHaveAnAccount,
                              ),
                              TextSpan(
                                text: context.s.signIn,
                                style: TextStyles.hintText1.copyWith(
                                  color: LightPalette.primaryButtonColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.r
                                      .pushNamed(SignInScreen.nameRoute),
                              ),
                            ],
                          ),
                        )
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                style: TextStyles.hintText1,
                                text: context.s.noAcc,
                              ),
                              TextSpan(
                                text: context.s.signUp,
                                style: TextStyles.hintText1.copyWith(
                                  color: LightPalette.primaryButtonColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.r.maybePop(),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            const Spacer(),
            ASKMElevatedButton.primary(
              isEnabled: isButtonEnabled,
              onPressed: isButtonEnabled
                  ? () {
                      if (formKey.currentState!.validate()) {
                        if (widget.isSignUp) {
                          widget.onSignUpButtonPressed!(
                            _email.text,
                            _pass.text,
                          );
                        } else {
                          widget.onSignInButtonPressed!(
                            _email.text,
                            _pass.text,
                          );
                        }
                      }
                    }
                  : () {},
              text: context.s.continueButton,
            ),
          ],
        ),
      ),
    );
  }
}
