import 'package:flutter/material.dart';
import 'package:touristic/presentation/pages/about/about_page.dart';
import 'package:touristic/presentation/pages/chat/chat_page_old.dart';
import 'package:touristic/presentation/pages/home/content_main_page.dart';
import 'package:touristic/presentation/pages/settings/settings_page.dart';

import '../../core/enums/app_feature.dart';
import '../../presentation/pages/favourites/favourites_page.dart';
import '../theme/app_theme.dart';

class AppRoutes {
  static const String chat = "/";
  static const String place = "/place";
  static const String budget = "/budget";
  static const String activity = "/activity";
  static const String recommendation = "/recommendation";
  static const String cuisine = "/cuisine";
  static const String itinerary = "/itinerary";
  static const String favourites = "/";
  static const String settings = "/settings";
  static const String about = "/about";

  static const Map<int, String> routeMap = {
    0: AppRoutes.chat,
    1: AppRoutes.place,
    2: AppRoutes.budget,
    3: AppRoutes.activity,
    4: AppRoutes.recommendation,
    5: AppRoutes.cuisine,
    6: AppRoutes.itinerary,
    7: AppRoutes.favourites,
    8: AppRoutes.settings,
    9: AppRoutes.about,
  };

  static Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case chat:
        return _materialRoute(const ChatPage());
      case place:
        return _contentMainPageRoute(AppFeature.touristPlace);
      case budget:
        return _contentMainPageRoute(AppFeature.budgetPlan);
      case itinerary:
        return _contentMainPageRoute(AppFeature.itinerary);
      case activity:
        return _contentMainPageRoute(AppFeature.activities);
      case recommendation:
        return _contentMainPageRoute(AppFeature.recommendation);
      case cuisine:
        return _contentMainPageRoute(AppFeature.localCuisine);
      case favourites:
        return _materialRoute(const FavouritesPage());
      case settings:
        return _materialRoute(const SettingsPage());
      case about:
        return _materialRoute(const AboutPage());
      default:
        return _notFoundRoute();
    }
  }

  static Route<dynamic> _contentMainPageRoute(AppFeature feature) {
    return _materialRoute(ContentMainPage(feature: feature));
  }

  static Route<dynamic> _notFoundRoute() {
    return _materialRoute(
      Container(
        color: AppTheme.blue90,
        child: const Center(
          child: Text(
            "Screen not found.",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: AppTheme.gray20,
            ),
          ),
        ),
      ),
    );
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return PageRouteBuilder(
      pageBuilder: (
        context,
        animation,
        secondaryAnimation,
      ) {
        return view;
      },
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300)
    );
  }
}
