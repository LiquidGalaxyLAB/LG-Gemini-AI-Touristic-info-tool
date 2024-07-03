import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class OutlinedInputField extends StatelessWidget {
  final TextEditingController _controller;
  final TextInputType _type;
  final String _hint;

  const OutlinedInputField({
    super.key,
    required TextEditingController controller,
    required TextInputType type,
    required String hint,
  })  : _controller = controller,
        _type = type,
        _hint = hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: _type,
      obscureText: _type == TextInputType.visiblePassword,
      style: TextStyle(
        color: AppTheme.gray.shade400,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        hintText: _hint,
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
