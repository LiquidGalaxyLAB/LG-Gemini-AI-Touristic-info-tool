import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../../domain/model/chat_item.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/input_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  final chats = [
    ChatItem(isMe: true, message: "halisda aof hasofh asofh asohf aho"),
    ChatItem(isMe: true, message: "halisda aof hasofh asofh asohf aho"),
    ChatItem(isMe: false, message: "halisda aof hasofh asofh asohf aho"),
    ChatItem(isMe: true, message: "halisda aof hasofh asofh asohf aho"),
    ChatItem(isMe: false, message: "halisda aof hasofh asofh asohf aho"),
    ChatItem(
        isMe: true,
        message: "halisda aof hasofh asofh asohf ahohalisda aof hasofh asofh asohf ahohalisda aof hasofh asofh asohf ahohalisda aof hasofh asofh asohf ahohalisda aof hasofh asofh asohf ahohalisda aof hasofh"),
  ];

  void _onSendClick() {}

  void _onAudioClick() {}

  void _onAttachClick() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: AppTheme.gray.shade900,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppTheme.gray.shade800,
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ChatBubble(
                        isMe: chats[index].isMe,
                        message: chats[index].message,
                      ),
                      if (index < chats.length - 1) const SizedBox(height: 24.0)
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          InputCard(
            controller: _controller,
            onAttachClick: _onAttachClick,
            onAudioClick: _onAudioClick,
            onSendClick: _onSendClick,
          ),
        ],
      ),
    );
  }
}
