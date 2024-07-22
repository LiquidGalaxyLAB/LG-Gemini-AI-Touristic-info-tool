import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class InputSubmitButton extends StatelessWidget {
  final Function _onContinueClick;

  const InputSubmitButton({
    super.key,
    required Function onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FilledButton(
        onPressed: () {
          _onContinueClick();
        },
        style: FilledButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fixedSize: const Size(120, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppTheme.color.shade700,
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              color: AppTheme.gray.shade200,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
