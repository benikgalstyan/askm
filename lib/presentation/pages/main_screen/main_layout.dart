import 'package:askm/presentation/widgets/action_wall.dart';
import 'package:askm/presentation/widgets/animated_header_widget.dart';
import 'package:askm/presentation/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:askm/presentation/widgets/app_bar.dart';
import 'package:askm/presentation/widgets/main_input_field.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _iconOpacityAnimation;

  bool _hasResponse = false;
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  final List<Map<String, String>> messages = [];
  final ScrollController chatController = ScrollController();

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _iconOpacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(animationController);

    _controller.addListener(() {
      if (_controller.text.isEmpty && !_hasResponse) {
        animationController.reverse();
      } else {
        animationController.forward();
      }
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    chatController.dispose();
    animationController.dispose();
    super.dispose();
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

      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
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

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _dismissKeyboard,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBarWidget(
            onHistoryTap: () {
              // TODO(Benik): implement navigation
            },
            onBookmarkTap: () {
              // TODO(Benik): implement navigation
            },
          ),
          body: Padding(
            padding: Spacings.paddingH16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!_hasResponse)
                  AnimatedHeaderWidget(
                    controller: animationController,
                    iconOpacityAnimation: _iconOpacityAnimation,
                  ),
                if (!_hasResponse)
                  ActionWall(
                    controller: animationController,
                    iconOpacityAnimation: _iconOpacityAnimation,
                    onWriteTap: () {
                      // TODO(Benik): implement action wall logic
                    },
                    onTellMeTap: () {},
                    onHelpMePickTap: () {},
                    onRecommendADishTap: () {},
                  ),
                Spacings.spacer12,
                if (_hasResponse)
                  ChatWidget(
                    messages: messages,
                    chatController: chatController,
                    onRefreshTap: () {
                      // TODO(Benik): Implement refresh logic
                    },
                  ),
                MainInputField(
                  controller: _controller,
                  iconOpacityAnimation: _iconOpacityAnimation,
                  onMicTap: () {
                    // TODO(Benik): implement on mic logic
                  },
                  onSendTap: _sendMessage,
                  onFocus: () => WidgetsBinding.instance
                      .addPostFrameCallback((_) => _scrollToBottom()),
                ),
                Spacings.spacer12,
              ],
            ),
          ),
        ),
      );
}
