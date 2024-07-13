import 'package:flutter/material.dart';
import 'package:askm/core/templates/form_validators.dart';
import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';

class InputFieldWidget extends StatelessWidget {
  InputFieldWidget({
    super.key,
    this.textStyle,
    this.validator,
    this.controller,
    this.decoration,
    required this.labelText,
  });

  final String labelText;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextEditingController? controller;
  final SingleRegistrationValidatorFunction? validator;

  final defaultBorderRadius = BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.inputText1,
      validator: validator,
      decoration: decoration ??
          InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            errorStyle: TextStyles.errorText1,
            labelText: labelText,
            labelStyle: TextStyles.labelText1,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelStyle: TextStyles.labelText2,
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
      controller: controller,
      obscureText: false,
      cursorColor: LightPalette.cursorColor,
    );
  }
}
