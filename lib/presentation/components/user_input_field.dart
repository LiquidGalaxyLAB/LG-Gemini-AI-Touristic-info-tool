import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class UserInputField extends StatelessWidget {
  final String _title;
  final TextEditingController _controller;
  final TextInputType _inputType;
  final String _hint;

  const UserInputField({
    super.key,
    required TextEditingController controller,
    required TextInputType inputType,
    required String hint,
    required String title,
  })  : _title = title,
        _hint = hint,
        _inputType = inputType,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppTheme.gray.shade400,
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppTheme.gray.shade900,
          ),
          child: TextField(
            controller: _controller,
            keyboardType: _inputType,
            enableSuggestions: false,
            cursorColor: AppTheme.color.shade700,
            autocorrect: false,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppTheme.gray.shade400,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              hintStyle: TextStyle(
                color: AppTheme.gray.shade700,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              hintText: _hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.gray.shade900, width: 0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.gray.shade900, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.gray.shade900, width: 0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
