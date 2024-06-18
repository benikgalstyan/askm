import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType { primary, secondary, social }

class ASKMElevatedButton extends StatelessWidget {
  const ASKMElevatedButton._({
    this.type,
    this.iconPath,
    this.isEnabled,
    required this.text,
    required this.onPressed,
  });

  factory ASKMElevatedButton.primary({
    required String text,
    required bool isEnabled,
    required VoidCallback onPressed,
    required ButtonType type,
  }) =>
      ASKMElevatedButton._(
        text: text,
        onPressed: onPressed,
        isEnabled: isEnabled,
        type: ButtonType.primary,
      );

  factory ASKMElevatedButton.social({
    required String text,
    required VoidCallback onPressed,
    required ButtonType type,
    required String iconPath,
  }) =>
      ASKMElevatedButton._(
        text: text,
        onPressed: onPressed,
        type: ButtonType.social,
        iconPath: iconPath,
      );

  factory ASKMElevatedButton.secondary({
    required String text,
    required VoidCallback onPressed,
    required ButtonType type,
  }) =>
      ASKMElevatedButton._(
        text: text,
        type: ButtonType.secondary,
        onPressed: onPressed,
      );

  final String text;
  final bool? isEnabled;
  final String? iconPath;
  final ButtonType? type;
  final VoidCallback? onPressed;

  static const elevation = 0.0;
  static const defaultHeight = 50.0;
  static const defaultWidth = 320.0;
  static const buttonBorder = Radius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    final buttonColor = switch (type) {
      ButtonType.primary => Colors.green,
      ButtonType.secondary => Colors.white,
      ButtonType.social => Colors.white,
      _ => Colors.green,
    };

    final textButtonColor = switch (type) {
      ButtonType.primary => Colors.white,
      ButtonType.secondary => Colors.black,
      ButtonType.social => Colors.black,
      _ => Colors.white,
    };

    Widget maybeGetIcon(String? iconPath) {
      if (iconPath != null) {
        return SvgPicture.asset(iconPath);
      } else {
        return const SizedBox.shrink();
      }
    }

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
            maybeGetIcon(iconPath),
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
