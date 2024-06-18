import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: Spacings.xxL,
    color: LightPalette.whiteColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.whiteColor,
  );
  static const TextStyle buttonText1 = TextStyle(
    fontSize: Spacings.L,
    fontWeight: FontWeight.w400,
    color: LightPalette.whiteColor,
  );
}
