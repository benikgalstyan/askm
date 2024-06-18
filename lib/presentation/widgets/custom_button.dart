import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ASKMElevatedButton extends StatelessWidget {
  const ASKMElevatedButton._({
    this.icon,
    this.isEnabled,
    this.buttonColor,
    this.textButtonColor,
    required this.text,
    required this.onPressed,
  });

  factory ASKMElevatedButton.primary({
    required String text,
    required bool isEnabled,
    required VoidCallback onPressed,
  }) =>
      ASKMElevatedButton._(
        text: text,
        onPressed: onPressed,
        buttonColor: isEnabled ? LightPalette.primaryButtonColor : LightPalette.disabledButtonColor,
        textButtonColor: isEnabled ? LightPalette.whiteColor : LightPalette.disabledTextButtonColor,
        isEnabled: isEnabled,
      );

  factory ASKMElevatedButton.secondaryWithIcon({
    required String text,
    required VoidCallback onPressed,
  }) =>
      ASKMElevatedButton._(
        text: text,
        onPressed: onPressed,
        buttonColor: LightPalette.whiteColor,
        textButtonColor: LightPalette.blackColor,
        icon: SvgPicture.asset(Assets.images.googleIcon),
      );

  factory ASKMElevatedButton.secondary({
    required String text,
    required VoidCallback onPressed,
  }) =>
      ASKMElevatedButton._(
        text: text,
        onPressed: onPressed,
        textButtonColor: LightPalette.whiteColor,
        buttonColor: LightPalette.secondaryButtonColor,
      );

  final String text;
  final Widget? icon;
  final bool? isEnabled;
  final Color? buttonColor;
  final Color? textButtonColor;
  final VoidCallback? onPressed;

  static const elevation = 0.0;
  static const defaultHeight = 50.0;
  static const defaultWidth = 320.0;
  static const buttonBorder = Radius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultHeight,
      width: defaultWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: elevation,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(buttonBorder),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(width: Spacings.S),
            Text(
              text,
              style: TextStyles.buttonText1.copyWith(color: textButtonColor),
            ),
          ],
        ),
      ),
    );
  }
}
