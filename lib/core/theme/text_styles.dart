import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/generated/assets/fonts.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: Spacings.xxL,
    color: LightPalette.whiteColor,
    fontFamily: FontFamily.lexendMega,
  );

  static const TextStyle headline2 =
      TextStyle(fontSize: Spacings.xxxL, fontWeight: FontWeight.w500);

  static const TextStyle bodyText1 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.whiteColor,
    fontFamily: FontFamily.workSans,
  );
  static const TextStyle buttonText1 = TextStyle(
    fontSize: Spacings.L,
    fontWeight: FontWeight.w500,
    color: LightPalette.whiteColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle labelText1 = TextStyle(
    fontSize: Spacings.L,
    fontWeight: FontWeight.w500,
    color: LightPalette.disabledTextButtonColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle labelText2 = TextStyle(
    fontSize: Spacings.L,
    fontWeight: FontWeight.w500,
    color: LightPalette.focusColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle inputText1 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.blackColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle errorText1 = TextStyle(
    fontSize: Spacings.M,
    color: LightPalette.errorColor,
    fontFamily: FontFamily.workSans,
  );
  static const TextStyle hintText1 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.blackColor,
    fontFamily: FontFamily.workSans,
  );
}
