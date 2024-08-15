import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/dependency_injection.dart';
import '../../presentation/features/about/about_page.dart';
import '../../presentation/features/activity/activity_page.dart';
import '../../presentation/features/activity/bloc/activities_bloc.dart';
import '../../presentation/features/budget/bloc/budget_plan_bloc.dart';
import '../../presentation/features/budget/budget_page.dart';
import '../../presentation/features/chat/bloc/chat_bloc.dart';
import '../../presentation/features/chat/chat_page.dart';
import '../../presentation/features/cuisine/bloc/cuisines_bloc.dart';
import '../../presentation/features/cuisine/cuisine_page.dart';
import '../../presentation/features/favourites/bloc/favourites_bloc.dart';
import '../../presentation/features/favourites/favourites_page.dart';
import '../../presentation/features/itinerary/bloc/itinerary_bloc.dart';
import '../../presentation/features/itinerary/itinerary_page.dart';
import '../../presentation/features/recommendation/bloc/recommendations_bloc.dart';
import '../../presentation/features/recommendation/recommendation_page.dart';
import '../../presentation/features/settings/settings_page.dart';
import '../../presentation/features/tourist_place/bloc/tourist_places_bloc.dart';
import '../../presentation/features/tourist_place/tourist_place_page.dart';
import '../theme/app_theme.dart';

class AppRoutes {
  static const String place = "/";
  static const String budget = "/budget";
  static const String activity = "/activity";
  static const String recommendation = "/recommendation";
  static const String cuisine = "/cuisine";
  static const String itinerary = "/itinerary";
  static const String favourites = "/favourites";
  static const String chat = "/chat";
  static const String settings = "/settings";
  static const String about = "/about";

  static const Map<int, String> routeMap = {
    0: AppRoutes.place,
    1: AppRoutes.budget,
    2: AppRoutes.activity,
    3: AppRoutes.recommendation,
    4: AppRoutes.cuisine,
    5: AppRoutes.itinerary,
    6: AppRoutes.favourites,
    7: AppRoutes.chat,
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
        color: AppTheme.gray.shade900,
        child: Center(
          child: Text(
            "Screen not found.",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: AppTheme.gray.shade400,
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<ChatBloc>()),
              BlocProvider(create: (_) => sl<TouristPlacesBloc>()),
              BlocProvider(create: (_) => sl<BudgetPlanBloc>()),
              BlocProvider(create: (_) => sl<ActivitiesBloc>()),
              BlocProvider(create: (_) => sl<RecommendationsBloc>()),
              BlocProvider(create: (_) => sl<CuisinesBloc>()),
              BlocProvider(create: (_) => sl<ItineraryBloc>()),
              BlocProvider(create: (_) => sl<FavouritesBloc>()),
            ],
            child: view,
          );
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
