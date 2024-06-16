import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.icon,
    this.width,
    this.height,
    this.fontSize,
    this.textStyle,
    this.isProgress,
    this.borderSide,
    this.fontWeight,
    this.buttonColor,
    this.textButtonColor,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Widget? icon;
  final double? width;
  final double? height;
  final bool? isProgress;
  final double? fontSize;
  final Color? buttonColor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final Color? textButtonColor;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;

  static const elevation = 0.0;
  static const defaultHeight = 50.0;
  static const defaultWidth = 320.0;
  static const buttonBorder = Radius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? defaultHeight,
      width: width ?? defaultWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.grey,
          elevation: elevation,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: const BorderRadius.all(buttonBorder),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            const SizedBox(
              width: Spacings.S,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: Spacings.L,
                fontWeight: fontWeight ?? FontWeight.w400,
                color: textButtonColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
