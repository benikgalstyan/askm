import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/data/models/chat_session.dart';
import 'package:askm/presentation/pages/main_screen/provider/chat_session_controller.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/history_app_bar.dart';
import 'package:askm/presentation/widgets/session_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HistoryLayout extends ConsumerWidget {
  const HistoryLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firestoreController =
        ref.watch(chatSessionControllerProvider.notifier);

    return Scaffold(
      appBar: HistoryAppBarWidget(
        onHistoryCloseTap: () => context.r.maybePop(),
      ),
      // TODO(Benik): rewrite to switch case
      body: FutureBuilder(
        future: firestoreController.loadChatSessions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No chat sessions found.'));
          } else {
            final chatSessions = snapshot.data!;
            chatSessions.sort((a, b) => b.createdAt.compareTo(a.createdAt));
            final groupedSessions = _groupSessionsByTime(chatSessions);
            return Padding(
              padding: Spacings.paddingH16,
              child: ListView.builder(
                itemCount: groupedSessions.length,
                itemBuilder: (context, index) {
                  final dateGroup = groupedSessions[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: Spacings.paddingH16,
                        child: Text(
                          dateGroup['title']!,
                          style: TextStyles.historyTitle,
                        ),
                      ),
                      Spacings.spacer8,
                      ...((dateGroup['sessions'] as List<ChatSession>).map(
                        (session) => SessionsContainer(chatSession: session),
                      )),
                      if (index < groupedSessions.length - 1)
                        const Padding(
                          padding: Spacings.paddingH12,
                          child: Divider(),
                        ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  List<Map<String, dynamic>> _groupSessionsByTime(List<ChatSession> sessions) {
    final currentTime = DateTime.now();
    final List<Map<String, dynamic>> groupedSessions = [];

    final Map<String, List<ChatSession>> groups = {
      'Today': [],
      'Yesterday': [],
      'Last 7 Days': [],
      'Last 30 Days': [],
    };

    for (var session in sessions) {
      final diff = currentTime.difference(session.createdAt);
      final sessionDate = DateTime(
        session.createdAt.year,
        session.createdAt.month,
        session.createdAt.day,
      );
      final today =
          DateTime(currentTime.year, currentTime.month, currentTime.day);

      if (sessionDate == today) {
        groups['Today']!.add(session);
      } else if (sessionDate == today.subtract(const Duration(days: 1))) {
        groups['Yesterday']!.add(session);
      } else if (diff.inDays <= 7) {
        groups['Last 7 Days']!.add(session);
      } else if (diff.inDays <= 30) {
        groups['Last 30 Days']!.add(session);
      } else {
        final monthName = DateFormat('MMMM').format(session.createdAt);
        if (!groups.containsKey(monthName)) {
          groups[monthName] = [];
        }
        groups[monthName]!.add(session);
      }
    }

    for (var entry in groups.entries) {
      if (entry.value.isNotEmpty) {
        groupedSessions.add({
          'title': entry.key,
          'sessions': entry.value,
        });
      }
    }

    return groupedSessions;
  }
}
