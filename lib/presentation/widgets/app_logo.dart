import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.description,
  });

  final String? description;

  bool get isDescriptionPresent => description != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.images.logo),
        Text(
          context.s.askm,
          style: TextStyles.headline1,
        ),
        Spacings.spacer4,
        if (isDescriptionPresent)
          Padding(
            padding: Spacings.paddingH32,
            child: Text(
              description!,
              style: TextStyles.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
