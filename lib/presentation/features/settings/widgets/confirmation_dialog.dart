import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class ConfirmationDialog extends StatefulWidget {
  final String _prompt;
  final Function(bool) _onClick;

  const ConfirmationDialog({
    super.key,
    required Function(bool) onClick,
    required String prompt,
  })  : _prompt = prompt,
        _onClick = onClick;

  @override
  State<ConfirmationDialog> createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.gray.shade900,
      title: Text(
        "Are you sure?",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.gray.shade400,
        ),
      ),
      content: SizedBox(
        width: 350,
        child: Text(
          widget._prompt,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppTheme.gray.shade300,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget._onClick(false);
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
            widget._onClick(true);
            Navigator.of(context).pop();
          },
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppTheme.color.shade700,
          ),
          child: Text(
            "Confirm",
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
