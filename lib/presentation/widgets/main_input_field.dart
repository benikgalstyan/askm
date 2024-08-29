import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter/material.dart';

class MainInputField extends StatefulWidget {
  const MainInputField({
    super.key,
    required this.onFocus,
    required this.onMicTap,
    required this.onSendTap,
    required this.controller,
    required this.iconOpacityAnimation,
  });

  final VoidCallback onFocus;
  final VoidCallback onMicTap;
  final VoidCallback onSendTap;
  final TextEditingController controller;
  final Animation<double> iconOpacityAnimation;

  @override
  MainInputFieldState createState() => MainInputFieldState();
}

class MainInputFieldState extends State<MainInputField> {
  late FocusNode _focusNode;
  final borderRadius = BorderRadius.circular(30);
  static const inputFieldPadding =
      EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0);
  static const animationDuration = Duration(milliseconds: 300);
  static const sendIcon = Icon(Icons.send);
  static const micIcon = Icon(Icons.mic);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      widget.onFocus();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _focusNode.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: inputFieldPadding,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: LightPalette.borderGreyColor),
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: Spacings.paddingH16,
                child: TextField(
                  controller: widget.controller,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: context.s.askAnything,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: Listenable.merge(
                [widget.controller, widget.iconOpacityAnimation],
              ),
              builder: (context, child) {
                final bool hasText = widget.controller.text.isNotEmpty;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasText)
                      IconButton(icon: sendIcon, onPressed: widget.onSendTap),
                    if (!hasText)
                      AnimatedOpacity(
                        duration: animationDuration,
                        opacity: widget.iconOpacityAnimation.value,
                        child: IconButton(
                          icon: micIcon,
                          onPressed: widget.onMicTap,
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
