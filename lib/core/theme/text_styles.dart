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

  static const TextStyle headline2 = TextStyle(
    fontSize: Spacings.xL,
    color: LightPalette.blackColor,
    fontFamily: FontFamily.workSans,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.whiteColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.blackColor,
    fontFamily: FontFamily.workSans,
  );
  static const TextStyle buttonText1 = TextStyle(
    fontSize: Spacings.L,
    fontWeight: FontWeight.w400,
    color: LightPalette.whiteColor,
    fontFamily: FontFamily.workSans,
  );
}
