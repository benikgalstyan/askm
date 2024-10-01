import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    required this.onHistoryTap,
    required this.onBookmarkTap,
  });

  final VoidCallback onHistoryTap;
  final VoidCallback onBookmarkTap;

  final historyIcon = SvgPicture.asset(
    Assets.images.historyIcon,
    height: 24,
    width: 24,
  );
  final bookmarkIcon = SvgPicture.asset(
    Assets.images.bookmarkIcon,
    height: 24,
    width: 24,
  );
  final logoIcon =
      SvgPicture.asset(Assets.images.appBarLogo, height: 28, width: 28);

  @override
  Widget build(BuildContext context) => AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(icon: historyIcon, onPressed: onHistoryTap),
        actions: [
          IconButton(icon: bookmarkIcon, onPressed: onBookmarkTap),
        ],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            logoIcon,
            Spacings.spacer4,
            Text(context.s.askm, style: TextStyles.headline3),
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
