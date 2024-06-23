import 'package:flutter/material.dart';
import 'package:touristic/config/theme/color/app_color.dart';
import 'package:touristic/config/theme/color/impl/gray_color.dart';
import 'package:touristic/config/theme/style/card_theme.dart';
import 'package:touristic/core/enums/app_color_scheme.dart';

class AppTheme {
  static const Color blue90 = Color.fromRGBO(5, 9, 17, 1);
  static const Color blue80 = Color.fromRGBO(10, 18, 35, 1);
  static const Color blue70 = Color.fromRGBO(15, 27, 52, 1);
  static const Color blue60 = Color.fromRGBO(20, 36, 70, 1);
  static const Color purple40 = Color.fromRGBO(80, 60, 199, 1);
  static const Color gray30 = Color.fromRGBO(140, 158, 186, 1.0);
  static const Color gray20 = Color.fromRGBO(178, 201, 232, 1.0);
  static const Color gray10 = Color.fromRGBO(217, 229, 252, 1.0);

  static const String notoFont = "Noto";

  static GrayColor gray = GrayColor();
  static AppColor color = AppColor(colorScheme: AppColorScheme.indigo);

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
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppTheme.notoFont,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.blue60,
        background: AppTheme.blue90,
      ),
      textTheme: textTheme,
      cardTheme: appCardTheme
    );
  }
}
