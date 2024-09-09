import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionCard extends StatelessWidget {
  ActionCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.iconPath,
    required this.description,
  });

  final String title;
  final String iconPath;
  final String description;
  final VoidCallback onTap;

  static const iconSize = 24.0;
  static const elevation = 0.0;
  final borderRadius = BorderRadius.circular(10);
  final shapeOfCard =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Card(
        shape: shapeOfCard,
        elevation: elevation,
        color: LightPalette.cardColor,
        child: Padding(
          padding: Spacings.padding16,
          child: IntrinsicWidth(
            child: Row(
              children: [
                SvgPicture.asset(iconPath, height: iconSize, width: iconSize),
                Spacings.spacer16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyles.headline4),
                    Spacings.spacer4,
                    Text(description, style: TextStyles.bodyText2),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
