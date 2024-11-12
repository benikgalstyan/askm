import 'package:askm/presentation/pages/main_screen/provider/chat_session_controller.dart';
import 'package:askm/presentation/widgets/main_screen_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:askm/core/context_extensions.dart';
import 'package:askm/data/models/chat_session.dart';
import 'package:askm/presentation/pages/history_screen/history_screen.dart';
import 'package:askm/presentation/widgets/action_wall.dart';
import 'package:askm/presentation/widgets/animated_header_widget.dart';
import 'package:askm/presentation/widgets/chat_widget.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/app_bar.dart';
import 'package:askm/presentation/widgets/main_input_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainLayout extends ConsumerStatefulWidget {
  const MainLayout({super.key, this.chatSession});

  final ChatSession? chatSession;

  @override
  ConsumerState<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> _iconOpacityAnimation;

  bool isLoading = true;
  String? currentSessionId;
  bool _hasResponse = false;
  final _focusNode = FocusNode();
  static bool _hasShownShimmer = false;
  final _controller = TextEditingController();
  final List<Map<String, String>> messages = [];
  final ScrollController chatController = ScrollController();

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _setupListeners();

    if (widget.chatSession != null) {
      _initializeSession(widget.chatSession!);
    }

    _startLoading();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    chatController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _dismissKeyboard,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBarWidget(
            onHistoryTap: () => context.r.pushNamed(HistoryScreen.nameRoute),
            onBookmarkTap: _clearChatSession,
          ),
          body: Padding(
            padding: Spacings.paddingH16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLoading)
                  MainScreenShimmer()
                else ...[
                  if (!_hasResponse) ...[
                    AnimatedHeaderWidget(
                      controller: animationController,
                      iconOpacityAnimation: _iconOpacityAnimation,
                    ),
                    ActionWall(
                      controller: animationController,
                      iconOpacityAnimation: _iconOpacityAnimation,
                      onWriteTap: () {
                        // TODO(benik): implement on write tap
                      },
                      onTellMeTap: () {},
                      onHelpMePickTap: () {},
                      onRecommendADishTap: () {},
                    ),
                  ],
                  Spacings.spacer12,
                  if (_hasResponse)
                    ChatWidget(
                      messages: messages,
                      chatController: chatController,
                      onRefreshTap: () {
                        // TODO(benik): implement refresh logic
                      },
                    ),
                ],
                MainInputField(
                  controller: _controller,
                  iconOpacityAnimation: _iconOpacityAnimation,
                  onMicTap: () {
                    // TODO(benik): implement on mic logic
                  },
                  onSendTap: _sendMessage,
                  onFocus: _scrollToBottom,
                ),
                Spacings.spacer12,
              ],
            ),
          ),
        ),
      );

  void _setupAnimation() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _iconOpacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(animationController);
  }

  void _setupListeners() {
    _controller.addListener(_onInputChange);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) _scrollToBottom();
    });
  }

  // TODO(benik): rewrite later
  Future<void> _startLoading() async {
    if (!_hasShownShimmer) {
      await Future.delayed(const Duration(seconds: 1));
      _hasShownShimmer = true;
    }
    setState(() => isLoading = false);
  }

  void _clearChatSession() {
    setState(() {
      messages.clear();
      currentSessionId = null;
      _hasResponse = false;
      _controller.clear();
      animationController.reverse();
    });
  }

  void _initializeSession(ChatSession session) {
    setState(() {
      currentSessionId = session.id;
      messages.addAll(session.messages);
      _hasResponse = true;
    });
  }

  void _onInputChange() {
    if (_controller.text.isEmpty && !_hasResponse) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  Future<void> _saveChatSession() async {
    if (currentSessionId == null) {
      currentSessionId = await ref
          .read(chatSessionControllerProvider.notifier)
          .createNewSession(messages);
    } else {
      await ref
          .read(chatSessionControllerProvider.notifier)
          .saveChatSession(currentSessionId, messages);
    }
  }

  void _sendMessage() {
    final trimmedText = _controller.text.trim();
    if (trimmedText.isNotEmpty) {
      setState(() {
        _hasResponse = true;
        messages.add({
          'question': trimmedText,
          'answer': 'This is a mock response to: $trimmedText',
        });
        _controller.clear();
        animationController.reverse();
      });
      _scrollToBottom();
      _saveChatSession();
    }
  }

  void _scrollToBottom() {
    if (chatController.hasClients) {
      chatController.animateTo(
        chatController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _dismissKeyboard() => FocusScope.of(context).unfocus();
}
