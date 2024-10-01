import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';

class HistoryAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const HistoryAppBarWidget({super.key, required this.onHistoryCloseTap});

  final VoidCallback onHistoryCloseTap;

  final closeIcon = const Icon(Icons.close, size: 32);

  @override
  Widget build(BuildContext context) => Padding(
        padding: Spacings.paddingH16,
        child: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          actions: [
            IconButton(onPressed: onHistoryCloseTap, icon: closeIcon),
          ],
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.s.history, style: TextStyles.headline5),
            ],
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
