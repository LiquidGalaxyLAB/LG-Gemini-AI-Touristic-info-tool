import 'package:flutter/material.dart';
import 'package:touristic/core/utils/app_utils.dart';
import 'package:touristic/presentation/pages/home/home_screen.dart';

class AppRoutes {
  static const String root = "/";
  static const String input = "/input";
  static const String settings = "/settings";
  static const String favourites = "/favourites";
  static const String chat = "/chat";

  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return _materialRoute(const HomeScreen());

      default:
        return _materialRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (context) {
      setPreferredOrientations(context);
      return view;
    });
  }
}
