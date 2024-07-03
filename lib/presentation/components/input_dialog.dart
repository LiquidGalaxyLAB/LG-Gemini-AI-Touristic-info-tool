import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';
import 'outlined_input_field.dart';

class InputDialog extends StatefulWidget {
  final Function _onClick;
  final TextInputType _textInputType;
  final String _title;
  final String _hint;

  const InputDialog({
    super.key,
    required Function onClick,
    required String title,
    required String hint,
    required TextInputType textInputType,
  })  : _textInputType = textInputType,
        _hint = hint,
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
      content: OutlinedInputField(
        hint: widget._hint,
        controller: _textEditingController,
        type: widget._textInputType,
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
