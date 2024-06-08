import 'package:flutter/material.dart';

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


  // static const Color gray90 = Color.fromRGBO(26, 26, 26, 1.0);
  // static const Color gray80 = Color.fromRGBO(51, 51, 51, 1.0);
  // static const Color gray70 = Color.fromRGBO(77, 77, 77, 1.0);
  // static const Color gray60 = Color.fromRGBO(102, 102, 102, 1.0);
  // static const Color gray50 = Color.fromRGBO(128, 128, 128, 1.0);
  // static const Color gray40 = Color.fromRGBO(153, 153, 153, 1.0);
  // static const Color gray30 = Color.fromRGBO(179, 179, 179, 1.0);
  // static const Color gray20 = Color.fromRGBO(204, 204, 204, 1.0);
  // static const Color gray10 = Color.fromRGBO(241, 241, 241, 1.0);

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
}

ThemeData appTheme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppTheme.notoFont,
  );
}