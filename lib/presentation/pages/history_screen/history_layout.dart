import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/router/router.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:askm/data/models/chat_session.dart';
import 'package:askm/presentation/pages/main_screen/provider/chat_session_controller.dart';
import 'package:askm/presentation/pages/sign_up_screen/provider/auth_controller.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/dialog_manager_utils.dart';
import 'package:askm/presentation/widgets/history_app_bar.dart';
import 'package:askm/presentation/widgets/history_screen_shimmer.dart';
import 'package:askm/presentation/widgets/session_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HistoryLayout extends ConsumerStatefulWidget {
  const HistoryLayout({super.key});

  @override
  ConsumerState<HistoryLayout> createState() => _HistoryLayoutState();
}

class _HistoryLayoutState extends ConsumerState<HistoryLayout> {
  late Future<List<ChatSession>> _chatSessionsFuture;

  bool isLoading = true;
  static const iconSize = 32.0;
  static bool _hasShownShimmer = false;
  static const logoutIcon = Icon(Icons.logout, size: iconSize);

  @override
  void initState() {
    super.initState();
    _chatSessionsFuture =
        ref.read(chatSessionControllerProvider.notifier).loadChatSessions();
    _startLoading();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            HistoryAppBarWidget(onHistoryCloseTap: () => context.r.maybePop()),
        body: isLoading
            ? HistoryScreenShimmer()
            : Column(
                children: [
                  Expanded(
                    child: FutureBuilder(
                      future: _chatSessionsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(context.s.noChatSessionsFound),
                          );
                        } else {
                          final chatSessions = snapshot.data!;
                          chatSessions.sort(
                            (a, b) => b.createdAt.compareTo(a.createdAt),
                          );
                          final groupedSessions =
                              _groupSessionsByTime(chatSessions);
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
                                    ...((dateGroup['sessions']
                                            as List<ChatSession>)
                                        .map(
                                      (session) => SessionsContainer(
                                        chatSession: session,
                                      ),
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
                  ),
                  Padding(
                    padding: Spacings.padding16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: logoutIcon,
                          onPressed: () => AlertManagerUtils.showSignOutWarning(
                            context,
                            onCancel: () => context.r.maybePop(),
                            onSubmit: () async {
                              await ref
                                  .read(authControllerProvider.notifier)
                                  .logout();
                              await context.r
                                  .replaceAll([const SocialSignUpRoute()]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      );

  // TODO(benik): rewrite later
  Future<void> _startLoading() async {
    if (!_hasShownShimmer) {
      await Future.delayed(const Duration(seconds: 1));
      _hasShownShimmer = true;
    }
    setState(() => isLoading = false);
  }

  List<Map<String, dynamic>> _groupSessionsByTime(List<ChatSession> sessions) {
    final currentTime = DateTime.now();
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
        groups.putIfAbsent(monthName, () => []).add(session);
      }
    }

    return groups.entries
        .where((entry) => entry.value.isNotEmpty)
        .map(
          (entry) => {
            'title': entry.key,
            'sessions': entry.value,
          },
        )
        .toList();
  }
}
