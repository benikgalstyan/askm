import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/router/router.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/data/models/chat_session.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SessionsContainer extends StatelessWidget {
  SessionsContainer({super.key, required this.chatSession});

  final ChatSession chatSession;
  static const incHeight = 57.0;
  final borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius,
      onTap: () {
        context.r.pushAndPopUntil(
          MainRoute(chatSession: chatSession),
          predicate: (route) => false,
        );
      },
      child: Ink(
        height: incHeight,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: borderRadius,
        ),
        padding: Spacings.paddingH16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacings.spacer16,
            Expanded(
              child: Text(chatSession.title, style: TextStyles.sessionTitle),
            ),
            Spacings.spacer16,
            Text(
              DateFormat('HH:mm  dd.MM.yyyy').format(chatSession.createdAt),
              style: TextStyles.dateTimeText,
            ),
          ],
        ),
      ),
    );
  }
}
