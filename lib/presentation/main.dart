import 'package:flutter/material.dart';

import '../config/theme/app_theme.dart';
import '../di/dependency_injection.dart';
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
    return MaterialApp(
      title: 'Touristic IA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (context) => const SplashScreen(),
        "/": (context) => const MainWrapper(),
      },
    );
  }
}
