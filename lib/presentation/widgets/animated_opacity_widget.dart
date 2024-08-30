import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatelessWidget {
  const AnimatedOpacityWidget({
    super.key,
    required this.child,
    required this.controller,
    required this.iconOpacityAnimation,
  });

  final AnimationController controller;
  final Animation<double> iconOpacityAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Opacity(
        opacity: iconOpacityAnimation.value,
        child: child,
      ),
      child: child,
    );
  }
}
