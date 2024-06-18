import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class InfoTextsWidget extends StatelessWidget {
  const InfoTextsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.s.askm,
          style: TextStyles.headline1,
        ),
        Text(
          context.s.whether,
          style: TextStyles.bodyText1,
        ),
        Text(
          context.s.comfort,
          style: TextStyles.bodyText1,
        ),
      ],
    );
  }
}
