import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../components/outlined_input_field.dart';

class AuthenticationDialog extends StatefulWidget {
  final Function(String, String) _onClick;

  const AuthenticationDialog({
    super.key,
    required Function(String, String) onClick,
  }) : _onClick = onClick;

  @override
  State<AuthenticationDialog> createState() => _AuthenticationDialogState();
}

class _AuthenticationDialogState extends State<AuthenticationDialog> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.gray.shade900,
      title: Text(
        "Verify to use this feature",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppTheme.gray.shade400,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedInputField(
            hint: "username",
            type: TextInputType.text,
            controller: _userController,
          ),
          const SizedBox(height: 12.0),
          OutlinedInputField(
            hint: "username",
            type: TextInputType.visiblePassword,
            controller: _passwordController,
          ),
        ],
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
            widget._onClick(
              _userController.text,
              _passwordController.text,
            );
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
