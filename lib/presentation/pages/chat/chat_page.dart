import 'package:flutter/material.dart';

import '../../../core/enums/chat_role.dart';
import '../../widgets/chat_bubble.dart';

class ChatMessage {
  final String message;
  final ChatRole role;

  ChatMessage({required this.message, required this.role});
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatMessage> messages = [
    ChatMessage(message: "Hi there!", role: ChatRole.receiver),
    ChatMessage(message: "Hello!", role: ChatRole.sender),
    ChatMessage(message: "How are you?", role: ChatRole.receiver),
    ChatMessage(message: "I'm good, thanks! How about you?", role: ChatRole.sender),
    ChatMessage(message: "I'm great!", role: ChatRole.receiver),
    ChatMessage(message: "What are you up to?", role: ChatRole.sender),
  ];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(message: _controller.text, role: ChatRole.sender));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return ChatBubble(
                    message: message.message,
                    role: message.role,
                  );
                },
              ),
            ),
            _buildInputArea(),
          ],
        ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (text) {
                setState(() {}); // Rebuild to show/hide send button
              },
            ),
          ),

          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
          _controller.text.isEmpty
              ? SizedBox.shrink()
              : IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}