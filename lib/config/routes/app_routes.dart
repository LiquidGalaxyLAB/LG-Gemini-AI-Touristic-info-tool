import 'package:flutter/material.dart';

import '../../presentation/features/about/about_page.dart';
import '../../presentation/features/activity/activity_page.dart';
import '../../presentation/features/budget/budget_page.dart';
import '../../presentation/features/chat/chat_page.dart';
import '../../presentation/features/cuisine/cuisine_page.dart';
import '../../presentation/features/favourites/favourites_page.dart';
import '../../presentation/features/itinerary/itinerary_page.dart';
import '../../presentation/features/recommendation/recommendation_page.dart';
import '../../presentation/features/settings/settings_page.dart';
import '../../presentation/features/tourist_place/tourist_place_page.dart';
import '../theme/app_theme.dart';

class AppRoutes {
  static const String chat = "/";
  static const String place = "/place";
  static const String budget = "/budget";
  static const String activity = "/activity";
  static const String recommendation = "/recommendation";
  static const String cuisine = "/cuisine";
  static const String itinerary = "/itinerary";
  static const String favourites = "/favourites";
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
        return _materialRoute(const TouristPlacePage());
      case budget:
        return _materialRoute(const BudgetPage());
      case itinerary:
        return _materialRoute(const ItineraryPage());
      case activity:
        return _materialRoute(const ActivityPage());
      case recommendation:
        return _materialRoute(const RecommendationPage());
      case cuisine:
        return _materialRoute(const CuisinePage());
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
        transitionDuration: const Duration(milliseconds: 300));
  }
}
