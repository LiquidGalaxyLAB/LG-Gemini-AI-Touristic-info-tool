import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class ConnectionTypeCard extends StatelessWidget {
  final bool _selected;
  final String _label;
  final Function _onPressed;

  const ConnectionTypeCard({
    super.key,
    required bool selected,
    required String label,
    required Function onPressed,
  })  : _onPressed = onPressed,
        _label = label,
        _selected = selected;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        _onPressed();
      },
      style: FilledButton.styleFrom(
        fixedSize: const Size(250, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor:
            _selected ? AppTheme.color.shade700 : AppTheme.gray.shade700,
      ),
      child: Text(
        _label,
        style: TextStyle(
          color: _selected ? AppTheme.gray.shade200 : AppTheme.gray.shade400,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
