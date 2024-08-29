import 'package:askm/core/context_extensions.dart';
import 'package:askm/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:askm/core/theme/palette/light_palette.dart';
import 'package:askm/generated/assets/assets.gen.dart';
import 'package:askm/presentation/tokens/spacing.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.messages,
    required this.onRefreshTap,
    required this.chatController,
  });

  final VoidCallback onRefreshTap;
  final ScrollController chatController;
  final List<Map<String, String>> messages;

  @override
  ChatWidgetState createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget> {
  final borderRadius = BorderRadius.circular(20.0);
  final refreshIcon = SvgPicture.asset(
    Assets.images.refresh,
  );

  @override
  Widget build(BuildContext context) => Expanded(
        child: SingleChildScrollView(
          controller: widget.chatController,
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.messages
                .map(
                  (message) => Padding(
                    padding: Spacings.padding12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['question']!,
                          style: TextStyles.questionText,
                        ),
                        Spacings.spacer32,
                        Container(
                          padding: Spacings.padding16,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: LightPalette.answerContainerColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    context.s.answer,
                                    style: TextStyles.answerText1,
                                  ),
                                  IconButton(
                                    icon: refreshIcon,
                                    onPressed: widget.onRefreshTap,
                                  ),
                                ],
                              ),
                              Spacings.spacer8,
                              Text(
                                message['answer']!,
                                style: TextStyles.answerText2,
                              ),
                            ],
                          ),
                        ),
                        Spacings.spacer20
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
