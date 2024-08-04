import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class InputSubmitButton extends StatefulWidget {
  final Function _onContinueClick;

  const InputSubmitButton({
    super.key,
    required Function onContinueClick,
  }) : _onContinueClick = onContinueClick;

  @override
  State<InputSubmitButton> createState() => _InputSubmitButtonState();
}

class _InputSubmitButtonState extends State<InputSubmitButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: FilledButton(
        onPressed: () async {
          if (!_loading) {
            setState(() {
              _loading = true;
            });
            await widget._onContinueClick();
            setState(() {
              _loading = false;
            });
          }
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
          child: !_loading
              ? Text(
                  "Continue",
                  style: TextStyle(
                    color: AppTheme.gray.shade200,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    color: AppTheme.color.shade50,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 3,
                  ),
                ),
        ),
      ),
    );
  }
}
