import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.child,
    required this.backgroundImage,
  });

  final Widget child;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        child,
      ],
    );
  }
}
