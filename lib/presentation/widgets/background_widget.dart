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
          Assets.images.backgroundImage.keyName,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,        ),
        child,
      ],
    );
  }
}
