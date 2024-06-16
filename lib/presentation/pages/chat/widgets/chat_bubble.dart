import 'dart:io';

import 'package:flutter/material.dart';
import 'package:touristic/core/enums/chat_role.dart';

class ChatBubble extends StatelessWidget {
  final ChatRole _role;
  final String _message;
  final File? _image;

  const ChatBubble({
    super.key,
    required ChatRole role,
    required String message,
    File? image,
  })  : _image = image,
        _role = role,
        _message = message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (_role == ChatRole.gemini)
        const Icon(
          Icons.face_rounded,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: _role == ChatRole.user ? Radius.circular(10) : Radius.zero,
              topRight: _role == ChatRole.gemini ? Radius.circular(10) : Radius.zero,
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          margin: const EdgeInsets.only(left: 4),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _role.title,
                ),
                if (_image != null)
                  Image.file(
                    _image,
                  ),
                Text(
                  _message,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),
        if (_role == ChatRole.user)
          const Icon(
            Icons.person_rounded,
          ),
      ],
    );
  }
}
