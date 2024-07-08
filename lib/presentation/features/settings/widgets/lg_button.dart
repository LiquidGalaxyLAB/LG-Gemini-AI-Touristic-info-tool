import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class LGButton extends StatelessWidget {
  final String _label;
  final IconData _icon;
  final Function() _onPressed;
  final bool _enabled;
  final bool _styleSmall;

  const LGButton({
    required String label,
    required IconData icon,
    required dynamic Function() onPressed,
    required bool enabled,
    bool styleSmall = false,
    super.key,
  })  : _styleSmall = styleSmall,
        _enabled = enabled,
        _onPressed = onPressed,
        _icon = icon,
        _label = label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _styleSmall ? 170 : 350,
      height: 55,
      child: FilledButton(
        onPressed: () {
          if (_enabled) {
            _onPressed();
          }
        },
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppTheme.gray.shade800,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _label,
              style: TextStyle(
                color: AppTheme.gray.shade300,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(
              _icon,
              color: AppTheme.gray.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
