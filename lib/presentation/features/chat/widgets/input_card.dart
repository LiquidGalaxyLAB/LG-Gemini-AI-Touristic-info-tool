import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class InputCard extends StatefulWidget {
  final Function _onAttachClick;
  final Function _onAudioClick;
  final Function(String) _onSendClick;
  final TextEditingController _controller;
  final bool _isListening;

  const InputCard({
    super.key,
    required Function onAttachClick,
    required Function onAudioClick,
    required Function(String) onSendClick,
    required TextEditingController controller,
    required bool isListening,
  })  : _controller = controller,
        _onSendClick = onSendClick,
        _onAudioClick = onAudioClick,
        _onAttachClick = onAttachClick,
        _isListening = isListening;

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  Color color = AppTheme.color.shade700;

  @override
  void initState() {
    super.initState();
    widget._controller.addListener(() {
      setState(() {
        color = widget._controller.text.isEmpty ? AppTheme.color.shade800 : AppTheme.color.shade600;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.gray.shade800,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget._controller,
              keyboardType: TextInputType.text,
              enableSuggestions: false,
              cursorColor: AppTheme.color.shade700,
              autocorrect: false,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppTheme.gray.shade300,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                hintStyle: TextStyle(
                  color: AppTheme.gray.shade700,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                hintText: "Hi Gemini, Recommend me some mountain places to visit in India",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppTheme.gray.shade800, width: 0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppTheme.gray.shade800, width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppTheme.gray.shade800, width: 0),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 60,
            width: 4,
            color: AppTheme.gray.shade900,
          ),
          IconButton(
            onPressed: () {
              widget._onAttachClick();
            },
            icon: Icon(
              Icons.attach_file_rounded,
              color: AppTheme.gray.shade400,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              widget._onAudioClick();
            },
            icon: Icon(
              Icons.mic_rounded,
              color: widget._isListening ? AppTheme.color.shade700 : AppTheme.gray.shade400,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              String text = widget._controller.text;
              if (text.isNotEmpty) {
                widget._onSendClick(text);
              }
            },
            icon: Icon(
              Icons.send_rounded,
              color: color,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
