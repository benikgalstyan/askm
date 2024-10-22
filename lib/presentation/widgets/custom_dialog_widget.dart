import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  CustomDialogWidget({
    super.key,
    required this.onYes,
    required this.onNo,
    required this.title,
    required this.topTitle,
  });

  final String title;
  final String topTitle;
  final VoidCallback onNo;
  final VoidCallback onYes;

  final borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: LightPalette.dialogColor,
        child: Padding(
          padding: Spacings.padding24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(topTitle, style: TextStyles.dialogTopTitle),
              Spacings.spacer16,
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyles.dialogTitle,
              ),
              Spacings.spacer24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ASKMElevatedButton.alert(
                      onPressed: onNo,
                      text: context.s.cancel,
                    ),
                  ),
                  Spacings.spacer16,
                  Expanded(
                    child: ASKMElevatedButton.alert(
                      onPressed: onYes,
                      text: context.s.logOut,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
