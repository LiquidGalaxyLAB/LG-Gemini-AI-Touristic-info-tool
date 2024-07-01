import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/theme/app_theme.dart';
import '../di/dependency_injection.dart';
import 'features/activity/bloc/activities_bloc.dart';
import 'features/budget/bloc/budget_plan_bloc.dart';
import 'features/cuisine/bloc/cuisines_bloc.dart';
import 'features/favourites/bloc/favourites_bloc.dart';
import 'features/itinerary/bloc/itinerary_bloc.dart';
import 'features/recommendation/bloc/recommendations_bloc.dart';
import 'features/tourist_place/bloc/tourist_places_bloc.dart';
import 'main_wrapper.dart';
import 'splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.loadPreferences();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<TouristPlacesBloc>()),
        BlocProvider(create: (_) => sl<BudgetPlanBloc>()),
        BlocProvider(create: (_) => sl<ActivitiesBloc>()),
        BlocProvider(create: (_) => sl<RecommendationsBloc>()),
        BlocProvider(create: (_) => sl<CuisinesBloc>()),
        BlocProvider(create: (_) => sl<ItineraryBloc>()),
        BlocProvider(create: (_) => sl<FavouritesBloc>()),
      ],
      child: MaterialApp(
        title: 'Touristic IA',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme(),
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (context) => const SplashScreen(),
          "/": (context) => const MainWrapper(),
        },
      ),
    );
  }
}
