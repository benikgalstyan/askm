import 'package:askm/generated/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          Assets.images.backgroundImage.keyName,
        ),
        child,
      ],
    );
  }
}
