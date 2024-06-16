import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/enums/app_color_scheme.dart';
import 'impl/blue_color.dart';
import 'impl/gray_color.dart';
import 'impl/green_color.dart';
import 'impl/indigo_color.dart';
import 'impl/pink_color.dart';
import 'impl/purple_color.dart';
import 'impl/red_color.dart';
import 'impl/yellow_color.dart';

abstract class AppColor {
  Color get shade50;

  Color get shade100;

  Color get shade200;

  Color get shade300;

  Color get shade400;

  Color get shade500;

  Color get shade600;

  Color get shade700;

  Color get shade800;

  Color get shade900;

  factory AppColor({
    AppColorScheme colorScheme = AppColorScheme.blue,
  }) {
    switch (colorScheme) {
      case AppColorScheme.gray:
        return GrayColor();
      case AppColorScheme.red:
        return RedColor();
      case AppColorScheme.yellow:
        return YellowColor();
      case AppColorScheme.green:
        return GreenColor();
      case AppColorScheme.blue:
        return BlueColor();
      case AppColorScheme.indigo:
        return IndigoColor();
      case AppColorScheme.purple:
        return PurpleColor();
      case AppColorScheme.pink:
        return PinkColor();
      default:
        return BlueColor();
    }
  }
}
