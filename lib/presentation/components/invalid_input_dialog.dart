import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class InvalidInputDialog extends StatefulWidget {
  const InvalidInputDialog({super.key});

  @override
  State<InvalidInputDialog> createState() => _InvalidInputDialogState();
}

class _InvalidInputDialogState extends State<InvalidInputDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.gray.shade900,
      title: Text(
        "Invalid Input!",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.gray.shade400,
        ),
      ),
      content: SizedBox(
        width: 350,
        child: Text(
          "Please provide all inputs inorder to get response.",
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
