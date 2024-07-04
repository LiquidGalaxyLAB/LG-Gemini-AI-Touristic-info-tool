import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:touristic/config/theme/app_theme.dart';

class ChatBubble extends StatelessWidget {
  final bool _isMe;
  final String _message;
  final File? _image;

  const ChatBubble({
    super.key,
    required bool isMe,
    required String message,
    File? image,
  })  : _image = image,
        _isMe = isMe,
        _message = message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 550, maxHeight: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_isMe ? 10.0 : 0.0),
            topRight: const Radius.circular(10.0),
            bottomLeft: const Radius.circular(10.0),
            bottomRight: Radius.circular(_isMe ? 0.0 : 10.0),
          ),
          color: _isMe ? AppTheme.color.shade700 : AppTheme.gray.shade900,
        ),
        child: Markdown(
          shrinkWrap: true,
          data: _message,
          styleSheet: MarkdownStyleSheet(
            pPadding: EdgeInsets.zero,
            h1: TextStyle(
              color: _isMe ? AppTheme.gray.shade300 : AppTheme.gray.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            p: TextStyle(
              color: _isMe ? AppTheme.gray.shade300 : AppTheme.gray.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            h2: TextStyle(
              color: _isMe ? AppTheme.gray.shade300 : AppTheme.gray.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            a: TextStyle(
              color: _isMe ? AppTheme.gray.shade300 : AppTheme.gray.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
