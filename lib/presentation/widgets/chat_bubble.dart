import 'package:flutter/material.dart';

import '../../core/enums/chat_role.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final ChatRole role;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSender = role == ChatRole.sender;
    Alignment alignment = isSender ? Alignment.topRight : Alignment.topLeft;
    Color bubbleColor = isSender ? Colors.blue : Colors.grey.shade200;
    Color textColor = isSender ? Colors.white : Colors.black;

    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isSender ? Radius.circular(15) : Radius.zero,
            bottomRight: isSender ? Radius.zero : Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}