import 'package:flutter/material.dart';

import '../app_theme.dart';

CardTheme appCardTheme = CardTheme(
  elevation: 0,
  margin: EdgeInsets.zero,
  surfaceTintColor: AppTheme.gray.shade700,
  color: AppTheme.gray.shade700,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  clipBehavior: Clip.antiAlias,
);
