import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class InputDialog extends StatefulWidget {
  final Function _onClick;
  final TextInputType _textInputType;
  final String _title;
  final String _hint;

  const InputDialog({
    super.key,
    required Function onClick,
    required String title,
    required String hint, required TextInputType textInputType,
  })  : _textInputType = textInputType, _hint = hint,
        _title = title,
        _onClick = onClick;

  @override
  State<InputDialog> createState() => _InputDialogState();
}

class _InputDialogState extends State<InputDialog> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.gray.shade900,
      title: Text(
        widget._title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.gray.shade400,
        ),
      ),
      content: TextField(
        controller: _textEditingController,
        keyboardType: widget._textInputType,
        style: TextStyle(
          color: AppTheme.gray.shade400,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: widget._hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          hintStyle: TextStyle(
            color: AppTheme.gray.shade700,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.gray.shade800, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.gray.shade800, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppTheme.color.shade700, width: 1),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.gray.shade500,
            ),
          ),
        ),
        FilledButton(
          onPressed: () {
            String newChoice = _textEditingController.text.trim();
            if (newChoice.isNotEmpty) {
              setState(() {
                widget._onClick(newChoice);
              });
            }
          },
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppTheme.color.shade700,
          ),
          child: Text(
            "Add",
            style: TextStyle(
              color: AppTheme.gray.shade200,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
