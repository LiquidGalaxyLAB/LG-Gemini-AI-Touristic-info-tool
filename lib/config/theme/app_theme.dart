import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristic/core/constants/constants.dart';

import '../../core/enums/app_color_scheme.dart';
import '../../core/enums/preferences.dart';
import '../../core/utils/preferences_utils.dart';
import 'color/app_color.dart';
import 'color/impl/gray_color.dart';
import 'maps_theme.dart';
import 'style/card_theme.dart';

class AppTheme {
  static const String notoFont = "Noto";

  static GrayColor gray = GrayColor();

  static String mapTheme = mapsThemeNone;
  static MapType mapStyle = MapType.hybrid;
  static AppColor color = AppColor(colorScheme: AppColorScheme.indigo);

  static Future<void> loadPreferences() async {
    int appThemeIndex = await PreferencesUtils().getValue<int>(PreferencesKeys.appTheme.name) ?? 0;
    int mapsThemeIndex = await PreferencesUtils().getValue<int>(PreferencesKeys.mapsTheme.name) ?? 0;
    int mapsStyleIndex = await PreferencesUtils().getValue<int>(PreferencesKeys.mapsStyle.name) ?? 0;


    color = AppColor(colorScheme: AppColorScheme.values[appThemeIndex]);
    mapTheme = mapsThemesMap.values.toList()[mapsThemeIndex];
    mapStyle = mapsStylesMap.values.toList()[mapsStyleIndex];
  }

  static ThemeData appTheme() {
    const TextTheme textTheme = TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w900,
        fontSize: 48,
      ),
      displayMedium: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w800,
        fontSize: 42,
      ),
      displaySmall: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w700,
        fontSize: 36,
      ),
      headlineLarge: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w600,
        fontSize: 32,
      ),
      headlineMedium: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w500,
        fontSize: 28,
      ),
      headlineSmall: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w300,
        fontSize: 22,
      ),
      titleMedium: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w200,
        fontSize: 20,
      ),
      titleSmall: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w100,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w300,
        fontSize: 12,
      ),
      labelLarge: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w200,
        fontSize: 12,
      ),
      labelMedium: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w200,
        fontSize: 10,
      ),
      labelSmall: TextStyle(
        fontFamily: AppTheme.notoFont,
        fontWeight: FontWeight.w100,
        fontSize: 8,
      ),
    );

    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppTheme.gray.shade900,
        fontFamily: AppTheme.notoFont,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.color.shade700,
          surface: AppTheme.gray.shade900,
        ),
        textTheme: textTheme,
        cardTheme: appCardTheme);
  }
}
