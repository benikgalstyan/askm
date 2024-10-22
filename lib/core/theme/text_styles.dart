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

  static const TextStyle headline3 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.blackColor,
    fontFamily: FontFamily.lexendMega,
  );
  static const TextStyle headline4 = TextStyle(
    fontSize: Spacings.L,
    fontWeight: FontWeight.w500,
    color: LightPalette.titleColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: Spacings.xxL,
    color: LightPalette.titleColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle errorWidgetTextStyle = TextStyle(
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
    color: LightPalette.descriptionColor,
    fontFamily: FontFamily.workSans,
    fontSize: Spacings.M,
  );
  static const TextStyle bodyText3 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.whiteColor,
    fontFamily: FontFamily.workSans,
  );
  static const TextStyle bodyText4 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.blackColor,
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

  static const TextStyle labelText3 = TextStyle(
    fontSize: Spacings.xxL,
    fontWeight: FontWeight.w500,
    color: LightPalette.blackColor,
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
  static const TextStyle questionText = TextStyle(
    fontSize: Spacings.xL,
    color: LightPalette.answerColor,
    fontFamily: FontFamily.workSans,
  );

  static const TextStyle timeText = TextStyle(
    fontSize: Spacings.M,
    color: LightPalette.disabledTextButtonColor,
    fontFamily: FontFamily.workSans,
  );
  static const TextStyle answerText1 = TextStyle(
    fontSize: Spacings.xL,
    color: LightPalette.answerColor,
    fontFamily: FontFamily.workSans,
  );
  static const TextStyle answerText2 = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.disabledTextButtonColor,
    fontFamily: FontFamily.workSans,
  );
  static const TextStyle historyTitle = TextStyle(
    fontSize: Spacings.L,
    color: LightPalette.dayTitleColor,
    fontFamily: FontFamily.workSans,
  );
  static const sessionTitle = TextStyle(
    fontSize: Spacings.L,
    fontWeight: FontWeight.w500,
    color: LightPalette.blackColor,
  );
  static const dateTimeText = TextStyle(
    fontSize: Spacings.mL,
    color: LightPalette.dateTimeColor,
  );

  static const dialogTopTitle = TextStyle(
    fontSize: Spacings.xL,
    fontWeight: FontWeight.bold,
    fontFamily: FontFamily.workSans,
  );
  static const dialogTitle = TextStyle(
    fontSize: Spacings.L,
    fontFamily: FontFamily.workSans,
  );
}
