import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/widgets/animated_opacity_widget.dart';
import 'package:flutter/material.dart';

class AnimatedHeaderWidget extends StatelessWidget {
  const AnimatedHeaderWidget({
    super.key,
    required this.controller,
    required this.iconOpacityAnimation,
  });

  final AnimationController controller;
  final Animation<double> iconOpacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacityWidget(
      controller: controller,
      iconOpacityAnimation: iconOpacityAnimation,
      child: Text(
        context.s.askAnything,
        style: TextStyles.labelText3,
      ),
    );
  }
}
