import 'package:flutter/material.dart';
import 'package:askm/core/templates/form_validators.dart';
import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget({
    super.key,
    this.validator,
    this.controller,
    required this.labelText,
  });

  final String labelText;
  final TextEditingController? controller;
  final SingleRegistrationValidatorFunction? validator;

  final defaultBorderRadius = BorderRadius.circular(10);
  static const contentPadding =
      EdgeInsets.symmetric(vertical: 14, horizontal: 14);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      validator: validator,
      controller: controller,
      style: TextStyles.inputText1,
      cursorColor: LightPalette.cursorColor,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: contentPadding,
        errorStyle: TextStyles.errorText1,
        labelStyle: TextStyles.labelText1,
        floatingLabelStyle: TextStyles.labelText2,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: LightPalette.focusColor),
          borderRadius: defaultBorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: LightPalette.borderColor),
          borderRadius: defaultBorderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: LightPalette.errorColor),
          borderRadius: defaultBorderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: LightPalette.errorColor),
          borderRadius: defaultBorderRadius,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: LightPalette.borderColor),
          borderRadius: defaultBorderRadius,
        ),
      ),
    );
  }
}
