import 'package:flutter/material.dart';
import 'package:touristic/core/utils/app_utils.dart';
import 'package:touristic/presentation/pages/home/content_main_page.dart';
import 'package:touristic/presentation/pages/settings/settings_page.dart';
import 'package:touristic/presentation/widgets/maps_widget.dart';

import '../theme/app_theme.dart';

class AppRoutes {
  static const String root = "/";
  static const String input = "/input";
  static const String settings = "/settings";
  static const String favourites = "/favourites";
  static const String chat = "/chat";

  static Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case root:
        return _materialRoute(ContentMainPage());

      case settings:
        return _materialRoute(SettingsPage());

      default:
        return _materialRoute(Container());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (context) {
      setPreferredOrientations(context);
      return view;
    });
  }
}
