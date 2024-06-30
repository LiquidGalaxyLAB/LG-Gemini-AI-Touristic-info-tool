import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

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
          _buildInputWidget(
            "username",
            TextInputType.text,
            _userController,
          ),
          const SizedBox(height: 12.0),
          _buildInputWidget(
            "username",
            TextInputType.visiblePassword,
            _passwordController,
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

  Widget _buildInputWidget(
    String hint,
    TextInputType type,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: type == TextInputType.visiblePassword,
      style: TextStyle(
        color: AppTheme.gray.shade400,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: hint,
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
    );
  }
}
