import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class InvalidInputDialog extends StatefulWidget {
  final String _title;
  final String _description;

  const InvalidInputDialog({
    super.key,
    required String title,
    required String description,
  })  : _title = title,
        _description = description;

  @override
  State<InvalidInputDialog> createState() => _InvalidInputDialogState();
}

class _InvalidInputDialogState extends State<InvalidInputDialog> {
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
      content: SizedBox(
        width: 350,
        child: Text(
          widget._description,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppTheme.gray.shade300,
          ),
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: AppTheme.color.shade700,
          ),
          child: Text(
            "Okay",
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
