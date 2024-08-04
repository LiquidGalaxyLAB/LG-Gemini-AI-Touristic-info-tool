import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constants/constants.dart';
import '../../core/enums/app_color_scheme.dart';
import '../../core/enums/preferences.dart';
import '../../core/utils/preferences_utils.dart';
import 'color/app_color.dart';
import 'color/impl/gray_color.dart';
import 'maps_theme.dart';

class AppTheme {
  static const String notoFont = "Noto";

  static GrayColor gray = GrayColor();

  static bool canAccessLGControls = false;
  static String mapTheme = mapsThemeNone;
  static MapType mapStyle = MapType.hybrid;
  static AppColor color = AppColor(colorScheme: AppColorScheme.blue);

  static Future<void> loadPreferences() async {
    int appThemeIndex = await PreferencesUtils().getValue<int>(GeneralPreferences.appTheme.name) ?? 3;
    int mapsStyleIndex = await PreferencesUtils().getValue<int>(GeneralPreferences.mapsStyle.name) ?? 3;
    int mapsThemeIndex = await PreferencesUtils().getValue<int>(GeneralPreferences.mapsTheme.name) ?? 0;

    color = AppColor(colorScheme: AppColorScheme.values[appThemeIndex + 1]);
    mapTheme = mapsThemesMap.values.toList()[mapsThemeIndex];
    mapStyle = mapsStylesMap.values.toList()[mapsStyleIndex];
  }

  static ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppTheme.gray.shade900,
      fontFamily: AppTheme.notoFont,
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: const WidgetStatePropertyAll<bool>(true),
        trackVisibility: const WidgetStatePropertyAll<bool>(true),
        thumbColor: WidgetStatePropertyAll<Color>(AppTheme.gray.shade600),
        trackColor: WidgetStatePropertyAll<Color>(AppTheme.gray.shade700),
        thickness: const WidgetStatePropertyAll<double>(8.0),
        radius: const Radius.circular(12.0),
        interactive: true,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.color.shade700,
        surface: AppTheme.gray.shade900,
      ),
    );
  }
}
