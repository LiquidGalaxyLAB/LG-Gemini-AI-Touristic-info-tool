import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class LGButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onPressed;
  final bool enabled;

  const LGButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.enabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: FilledButton(
        onPressed: () {
          if (enabled) {
            onPressed();
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
              label,
              style: TextStyle(
                color: AppTheme.gray.shade300,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(
              icon,
              color: AppTheme.gray.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
