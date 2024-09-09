import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckMailScreenWidget extends StatelessWidget {
  CheckMailScreenWidget({
    super.key,
    required this.onCheckEmailPressed,
  });

  final VoidCallback onCheckEmailPressed;

  static const upperFlex = 2;
  final mailImage =
      SvgPicture.asset(Assets.images.mail, height: 150, width: 150);
  static const horizontalPadding =
      EdgeInsets.symmetric(horizontal: Spacings.xxxxL);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          children: [
            const Spacer(flex: upperFlex),
            mailImage,
            Text(
              context.s.checkYourEmail,
              style: TextStyles.errorWidgetTextStyle,
            ),
            Spacings.spacer2,
            Padding(
              padding: horizontalPadding,
              child: Text(
                context.s.aSignInLinkHasBeenSentToYourEmail,
                textAlign: TextAlign.center,
                style: TextStyles.bodyText4,
              ),
            ),
            const Spacer(),
            ASKMElevatedButton.primary(
              isEnabled: true,
              text: context.s.okay,
              onPressed: onCheckEmailPressed,
            ),
            Spacings.spacer48,
          ],
        ),
      );
}
