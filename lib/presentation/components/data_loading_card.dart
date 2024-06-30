import 'package:flutter/material.dart';

import '../../config/theme/app_theme.dart';

class DataLoadingCard extends StatelessWidget {
  const DataLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppTheme.color.shade600,
        strokeCap: StrokeCap.round,
        strokeWidth: 5,
      ),
    );
  }
}
