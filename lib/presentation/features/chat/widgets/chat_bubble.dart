import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touristic/config/theme/app_theme.dart';

class ChatBubble extends StatelessWidget {
  final bool _isMe;
  final String _message;
  final XFile? _image;

  const ChatBubble({
    super.key,
    required bool isMe,
    required String message,
    XFile? image,
  })  : _image = image,
        _isMe = isMe,
        _message = message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          if (_image != null)
            Container(
              constraints: const BoxConstraints(maxHeight: 120, maxWidth: 150),
              margin: const EdgeInsets.only(bottom: 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: Image.file(
                    File(_image.path),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          Container(
            constraints: const BoxConstraints(maxWidth: 650),
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(_isMe ? 10.0 : 0.0),
                topRight: const Radius.circular(10.0),
                bottomLeft: const Radius.circular(10.0),
                bottomRight: Radius.circular(_isMe ? 0.0 : 10.0),
              ),
              color: _isMe ? AppTheme.color.shade700 : AppTheme.gray.shade900,
            ),
            child: MarkdownBody(
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
        ],
      ),
    );
  }
}
