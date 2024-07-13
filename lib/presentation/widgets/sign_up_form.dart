import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/templates/form_validators.dart';
import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:askm/presentation/widgets/input_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.onSignUpButtonPressed,
  });

  final void Function(String email, String password) onSignUpButtonPressed;

  @override
  State<SignUpForm> createState() => _MyLogFormWidgetState();
}

class _MyLogFormWidgetState extends State<SignUpForm> {
  bool isButtonEnabled = false;
  final _pass = TextEditingController();
  final _email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  static const spacer = SizedBox(height: 32);
  static const paddingTopLeft = EdgeInsets.only(top: 8, left: 12);

  @override
  void initState() {
    super.initState();
    _pass.addListener(_updateButtonState);
    _email.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _pass.dispose();
    _email.dispose();
    super.dispose();
    _pass.removeListener(_updateButtonState);
    _email.removeListener(_updateButtonState);
  }

  void _updateButtonState() {
    final isEmailNotEmpty = _email.text.isNotEmpty;
    final isPasswordNotEmpty = _pass.text.isNotEmpty;
    setState(() => isButtonEnabled = isEmailNotEmpty && isPasswordNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
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
              validator: FormValidators.passwordRegValidator,
            ),
            Padding(
              padding: paddingTopLeft,
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(style: TextStyles.hintText1, text: context.s.alreadyHaveAnAccount),
                        TextSpan(
                          text: context.s.signIn,
                          style: TextStyles.hintText1.copyWith(
                            color: LightPalette.primaryButtonColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO(Benik): Implement sign in navigation
                            },
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
                        widget.onSignUpButtonPressed(_email.text, _pass.text);
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
