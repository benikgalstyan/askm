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
  late final Future<List<ChatSession>> _chatSessionsFuture;

  bool _isLoading = true;
  static const _iconSize = 32.0;
  static bool _hasShownShimmer = false;
  static const _logoutIcon = Icon(Icons.logout, size: _iconSize);

  @override
  void initState() {
    super.initState();
    _chatSessionsFuture =
        ref.read(chatSessionControllerProvider.notifier).loadChatSessions();
    _initializeLoading();
  }

  Future<void> _initializeLoading() async {
    if (!_hasShownShimmer) {
      await Future.delayed(const Duration(seconds: 1));
      _hasShownShimmer = true;
    }
    if (mounted) setState(() => _isLoading = false);
  }

  Future<void> _handleLogout(BuildContext context) async {
    final navigator = context.r;
    await ref.read(authControllerProvider.notifier).logout();
    if (!mounted) return;
    await navigator.replaceAll([const SocialSignUpRoute()]);
  }

  Widget _buildSessionList(List<ChatSession> sessions) {
    final groupedSessions = _groupSessionsByTime(
      sessions..sort((a, b) => b.createdAt.compareTo(a.createdAt)),
    );

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
                child:
                    Text(dateGroup['title']!, style: TextStyles.historyTitle),
              ),
              Spacings.spacer8,
              ...(dateGroup['sessions'] as List<ChatSession>)
                  .map((session) => SessionsContainer(chatSession: session)),
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

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            HistoryAppBarWidget(onHistoryCloseTap: () => context.r.maybePop()),
        body: _isLoading
            ? HistoryScreenShimmer()
            : Column(
                children: [
                  Expanded(
                    child: FutureBuilder<List<ChatSession>>(
                      future: _chatSessionsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        }

                        final sessions = snapshot.data;
                        if (sessions == null || sessions.isEmpty) {
                          return Center(
                            child: Text(context.s.noChatSessionsFound),
                          );
                        }

                        return _buildSessionList(sessions);
                      },
                    ),
                  ),
                  Padding(
                    padding: Spacings.padding16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: _logoutIcon,
                          onPressed: () => AlertManagerUtils.showSignOutWarning(
                            context,
                            onCancel: () => context.r.maybePop(),
                            onSubmit: () => _handleLogout(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      );

  List<Map<String, dynamic>> _groupSessionsByTime(List<ChatSession> sessions) {
    final currentTime = DateTime.now();
    final today =
        DateTime(currentTime.year, currentTime.month, currentTime.day);
    final groups = {
      'Today': <ChatSession>[],
      'Yesterday': <ChatSession>[],
      'Last 7 Days': <ChatSession>[],
      'Last 30 Days': <ChatSession>[],
    };

    for (final session in sessions) {
      final sessionDate = DateTime(
        session.createdAt.year,
        session.createdAt.month,
        session.createdAt.day,
      );
      final diff = currentTime.difference(session.createdAt);

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
        .map((entry) => {'title': entry.key, 'sessions': entry.value})
        .toList();
  }
}
