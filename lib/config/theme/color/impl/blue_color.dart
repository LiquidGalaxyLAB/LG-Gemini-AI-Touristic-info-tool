import 'dart:ui';

import '../app_color.dart';

class BlueColor implements AppColor {
  @override
  Color get shade50 => const Color(0xFFEBF5FF);
  @override
  Color get shade100 => const Color(0xFFE1EFFE);
  @override
  Color get shade200 => const Color(0xFFC3DDFD);
  @override
  Color get shade300 => const Color(0xFFA4CAFE);
  @override
  Color get shade400 => const Color(0xFF76A9FA);
  @override
  Color get shade500 => const Color(0xFF3F83F8);
  @override
  Color get shade600 => const Color(0xFF1C64F2);
  @override
  Color get shade700 => const Color(0xFF1A56DB);
  @override
  Color get shade800 => const Color(0xFF1E429F);
  @override
  Color get shade900 => const Color(0xFF233876);
}