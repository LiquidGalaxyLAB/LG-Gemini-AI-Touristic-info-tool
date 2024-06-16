import 'package:flutter/material.dart';
import 'package:touristic/config/theme/color/app_color.dart';
import 'package:touristic/config/theme/style/card_theme.dart';
import 'package:touristic/core/enums/app_color_scheme.dart';

class AppTheme {
  static const Color blue90 = Color.fromRGBO(5, 9, 17, 1);
  static const Color blue80 = Color.fromRGBO(10, 18, 35, 1);
  static const Color blue70 = Color.fromRGBO(15, 27, 52, 1);
  static const Color blue60 = Color.fromRGBO(20, 36, 70, 1);
  static const Color blue50 = Color.fromRGBO(25, 45, 87, 1);
  static const Color blue40 = Color.fromRGBO(30, 54, 105, 1);
  static const Color blue30 = Color.fromRGBO(35, 63, 122, 1);
  static const Color blue20 = Color.fromRGBO(40, 72, 140, 1);
  static const Color blue10 = Color.fromRGBO(45, 81, 157, 1);

  static const Color purple90 = Color.fromRGBO(23, 17, 57, 1);
  static const Color purple80 = Color.fromRGBO(34, 26, 85, 1);
  static const Color purple70 = Color.fromRGBO(46, 34, 114, 1);
  static const Color purple60 = Color.fromRGBO(57, 43, 142, 1);
  static const Color purple50 = Color.fromRGBO(69, 51, 171, 1);
  static const Color purple40 = Color.fromRGBO(80, 60, 199, 1);
  static const Color purple30 = Color.fromRGBO(92, 68, 228, 1);
  static const Color purple20 = Color.fromRGBO(103, 77, 255, 1);
  static const Color purple10 = Color.fromRGBO(102, 77, 255, 1);

  static const Color gray90 = Color.fromRGBO(13, 15, 19, 1.0);
  static const Color gray80 = Color.fromRGBO(25, 29, 38, 1.0);
  static const Color gray70 = Color.fromRGBO(38, 44, 57, 1.0);
  static const Color gray60 = Color.fromRGBO(50, 58, 76, 1.0);
  static const Color gray50 = Color.fromRGBO(63, 73, 95, 1.0);
  static const Color gray40 = Color.fromRGBO(101, 115, 140, 1.0);
  static const Color gray30 = Color.fromRGBO(140, 158, 186, 1.0);
  static const Color gray20 = Color.fromRGBO(178, 201, 232, 1.0);
  static const Color gray10 = Color.fromRGBO(217, 229, 252, 1.0);

  static const String notoFont = "Noto";

  static AppColor gray = AppColor(colorScheme: AppColorScheme.gray);
  static AppColor color = AppColor(colorScheme: AppColorScheme.blue);

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
