import 'package:flutter/material.dart';
import 'package:touristic/config/theme/app_theme.dart';

class StatusPanel extends StatelessWidget {
  final bool _connected;

  const StatusPanel({
    super.key,
    required bool connected,
  }) : _connected = connected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.connect_without_contact_rounded,
          color: AppTheme.gray.shade400,
          size: 72,
        ),
        const SizedBox(height: 12),
        Text(
          'Establish Connection with LG',
          style: TextStyle(
            color: AppTheme.gray.shade400,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'We will establish a connection with Liquid Galaxy to display data.',
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
