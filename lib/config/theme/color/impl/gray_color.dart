import 'dart:ui';

import '../app_color.dart';

class GrayColor implements AppColor {
  @override
  Color get shade50 => const Color(0xFFF9FAFB);
  @override
  Color get shade100 => const Color(0xFFF3F4F6);
  @override
  Color get shade200 => const Color(0xFFE5E7EB);
  @override
  Color get shade300 => const Color(0xFFD1D5DB);
  @override
  Color get shade400 => const Color(0xFF9CA3AF);
  @override
  Color get shade500 => const Color(0xFF6B7280);
  @override
  Color get shade600 => const Color(0xFF4B5563);
  @override
  Color get shade700 => const Color(0xFF374151);
  @override
  Color get shade800 => const Color(0xFF1F2937);
  @override
  Color get shade900 => const Color(0xFF111827);
}