import 'package:flutter/material.dart';
import 'package:touristic/core/utils/app_utils.dart';
import 'package:touristic/presentation/pages/about/about_page.dart';
import 'package:touristic/presentation/pages/chat/chat_page.dart';
import 'package:touristic/presentation/pages/favourite/favourite_page.dart';
import 'package:touristic/presentation/pages/home/content_main_page.dart';
import 'package:touristic/presentation/pages/settings/settings_page.dart';

import '../../core/enums/touristic_feature.dart';
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
        return _contentMainPageRoute(TouristicFeature.touristPlace);
      case budget:
        return _contentMainPageRoute(TouristicFeature.budgetPlan);
      case itinerary:
        return _contentMainPageRoute(TouristicFeature.itinerary);
      case activity:
        return _contentMainPageRoute(TouristicFeature.activities);
      case recommendation:
        return _contentMainPageRoute(TouristicFeature.recommendation);
      case cuisine:
        return _contentMainPageRoute(TouristicFeature.localCuisine);
      case favourites:
        return _materialRoute(const FavouritePage());
      case settings:
        return _materialRoute(const SettingsPage());
      case about:
        return _materialRoute(const AboutPage());
      default:
        return _notFoundRoute();
    }
  }

  static Route<dynamic> _contentMainPageRoute(TouristicFeature feature) {
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
    return MaterialPageRoute(builder: (context) {
      setPreferredOrientations(context);
      return view;
    });
  }
}
