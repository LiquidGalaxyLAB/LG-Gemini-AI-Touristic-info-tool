import 'dart:ui';

import '../app_color.dart';

class PinkColor implements AppColor {
  @override
  Color get shade50 => const Color(0xFFFDF2F8);
  @override
  Color get shade100 => const Color(0xFFFCE8F3);
  @override
  Color get shade200 => const Color(0xFFFAD1E8);
  @override
  Color get shade300 => const Color(0xFFF8B4D9);
  @override
  Color get shade400 => const Color(0xFFF17EB8);
  @override
  Color get shade500 => const Color(0xFFE74694);
  @override
  Color get shade600 => const Color(0xFFD61F69);
  @override
  Color get shade700 => const Color(0xFFBF125D);
  @override
  Color get shade800 => const Color(0xFF99154B);
  @override
  Color get shade900 => const Color(0xFF751A3D);
}