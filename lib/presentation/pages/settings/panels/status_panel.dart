import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';

class StatusPanel extends StatelessWidget {
  final bool _connected;
  final String _title;
  final String _description;
  final IconData _iconData;

  const StatusPanel({
    super.key,
    required bool connected,
    required String title,
    required String description,
    required IconData iconData,
  })  : _title = title,
        _description = description,
        _iconData = iconData,
        _connected = connected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          _iconData,
          color: AppTheme.gray.shade400,
          size: 72,
        ),
        const SizedBox(height: 12),
        Text(
          _title,
          style: TextStyle(
            color: AppTheme.gray.shade400,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          _description,
          style: TextStyle(
            color: AppTheme.gray.shade400,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          _connected ? 'Connected' : 'Disconnected',
          style: TextStyle(
            color: _connected ? Colors.green : Colors.red,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
