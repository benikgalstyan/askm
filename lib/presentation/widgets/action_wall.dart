import 'package:flutter/material.dart';
import 'package:askm/core/context_extensions.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/widgets/action_cards.dart';
import 'package:askm/presentation/widgets/animated_opacity_widget.dart';

class ActionWall extends StatelessWidget {
  const ActionWall({
    super.key,
    required this.controller,
    required this.onWriteTap,
    required this.onTellMeTap,
    required this.onHelpMePickTap,
    required this.onRecommendADishTap,
    required this.iconOpacityAnimation,
  });

  final VoidCallback onWriteTap;
  final VoidCallback onTellMeTap;
  final VoidCallback onHelpMePickTap;
  final AnimationController controller;
  final VoidCallback onRecommendADishTap;
  final Animation<double> iconOpacityAnimation;

  @override
  Widget build(BuildContext context) => Expanded(
        child: SingleChildScrollView(
          child: AnimatedOpacityWidget(
            controller: controller,
            iconOpacityAnimation: iconOpacityAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ActionCard(
                  title: context.s.write,
                  description: context.s.aPlanHowToLearnTrading,
                  iconPath: Assets.images.trade,
                  onTap: onWriteTap,
                ),
                ActionCard(
                  title: context.s.tellMe,
                  description: context.s.howToCareHomePlantMonstera,
                  iconPath: Assets.images.plant,
                  onTap: onTellMeTap,
                ),
                ActionCard(
                  title: context.s.helpMePick,
                  description: context.s.aBirthdayGiftForMyMom,
                  iconPath: Assets.images.gift,
                  onTap: onHelpMePickTap,
                ),
                ActionCard(
                  title: context.s.recommendADish,
                  description: context.s.forRomanticDinner,
                  iconPath: Assets.images.food,
                  onTap: onRecommendADishTap,
                ),
              ],
            ),
          ),
        ),
      );
}
