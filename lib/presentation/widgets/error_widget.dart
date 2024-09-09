import 'package:askm/core/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/custom_button.dart';

class ErrorScreenWidget extends StatelessWidget {
  ErrorScreenWidget({
    super.key,
    required this.onErrorPressed,
  });

  final VoidCallback onErrorPressed;

  static const upperFlex = 2;
  final errorImage = SvgPicture.asset(Assets.images.failure, height: 150, width: 150);

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      children: [
        const Spacer(flex: upperFlex),
        errorImage,
        Text(context.s.ooops, style: TextStyles.errorWidgetTextStyle),
        Text(context.s.smthWentWrong, style: TextStyles.bodyText2),
        const Spacer(),
        ASKMElevatedButton.primary(
          isEnabled: true,
          text: context.s.okay,
          onPressed: onErrorPressed,
        ),
        Spacings.spacer48,
      ],
    ),
  );
}
