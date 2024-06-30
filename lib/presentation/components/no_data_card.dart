import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class NoDataCard extends StatelessWidget {
  const NoDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.data_saver_off_rounded,
          size: 36,
          color: AppTheme.gray.shade400,
        ),
        const SizedBox(height: 12),
        Text(
          "No data available",
          style: TextStyle(
            color: AppTheme.gray.shade400,
            fontWeight: FontWeight.w500,
            fontFamily: "Noto",
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
