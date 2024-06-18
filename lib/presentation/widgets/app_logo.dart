import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.description,
  });

  final List<String>? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.images.logo),
        Text(
          context.s.askm,
          style: TextStyles.headline1,
        ),
        if (description != null)
          ...description!.map(
            (text) => Text(text, style: TextStyles.bodyText1),
          ),
      ],
    );
  }
}
