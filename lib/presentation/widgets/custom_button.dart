import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType { primary, secondary, social, alert }

class ASKMElevatedButton extends StatelessWidget {
  const ASKMElevatedButton({
    super.key,
    this.type,
    this.iconPath,
    this.isEnabled = true,
    required this.text,
    required this.onPressed,
  });

  factory ASKMElevatedButton.primary({
    required String text,
    required bool isEnabled,
    required VoidCallback onPressed,
  }) =>
      ASKMElevatedButton(
        text: text,
        isEnabled: isEnabled,
        onPressed: onPressed,
        type: ButtonType.primary,
      );

  factory ASKMElevatedButton.social({
    required String text,
    required bool isEnabled,
    required String iconPath,
    required VoidCallback onPressed,
  }) =>
      ASKMElevatedButton(
        text: text,
        iconPath: iconPath,
        onPressed: onPressed,
        isEnabled: isEnabled,
        type: ButtonType.social,
      );

  factory ASKMElevatedButton.secondary({
    required String text,
    required bool isEnabled,
    required VoidCallback onPressed,
  }) =>
      ASKMElevatedButton(
        text: text,
        onPressed: onPressed,
        isEnabled: isEnabled,
        type: ButtonType.secondary,
      );

  factory ASKMElevatedButton.alert({
    required String text,
    required VoidCallback onPressed,
  }) =>
      ASKMElevatedButton(
        text: text,
        onPressed: onPressed,
        type: ButtonType.alert,
      );

  final String text;
  final bool? isEnabled;
  final String? iconPath;
  final ButtonType? type;
  final VoidCallback? onPressed;

  static const elevation = 0.0;
  static const defaultHeight = 50.0;
  static const defaultWidth = 320.0;
  static const isButtonEnabled = true;
  static const buttonBorder = Radius.circular(30.0);

  VoidCallback? get _isButtonEnable => isEnabled! ? onPressed : null;

  @override
  Widget build(BuildContext context) {
    final buttonColor = switch (type) {
      ButtonType.social => LightPalette.whiteColor,
      ButtonType.alert => LightPalette.primaryButtonColor,
      ButtonType.primary => LightPalette.primaryButtonColor,
      ButtonType.secondary => LightPalette.secondaryButtonColor,
      _ => LightPalette.whiteColor,
    };

    final textButtonColor = switch (type) {
      ButtonType.social => LightPalette.blackColor,
      ButtonType.primary => LightPalette.whiteColor,
      ButtonType.secondary => LightPalette.whiteColor,
      _ => LightPalette.whiteColor,
    };
    final buttonWidth = switch (type) {
      ButtonType.alert => 120.0,
      _ => defaultWidth,
    };
    Widget maybeGetIcon(String? iconPath) {
      if (iconPath != null) {
        return SvgPicture.asset(iconPath);
      } else {
        return const SizedBox.shrink();
      }
    }

    Color? resolveButtonColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return LightPalette.disabledButtonColor;
      }
      return buttonColor;
    }

    Color getButtonColor() {
      if (isEnabled!) {
        return textButtonColor;
      } else {
        return LightPalette.disabledTextButtonColor;
      }
    }

    return SizedBox(
      height: defaultHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: _isButtonEnable,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith<Color?>(resolveButtonColor),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(buttonBorder),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            maybeGetIcon(iconPath),
            if (iconPath != null) const SizedBox(width: Spacings.S),
            Text(
              text,
              style: TextStyles.buttonText1.copyWith(
                color: getButtonColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
