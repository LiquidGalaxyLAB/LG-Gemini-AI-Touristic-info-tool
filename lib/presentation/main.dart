import 'package:flutter/material.dart';
import 'package:touristic/presentation/main_wrapper.dart';
import 'package:touristic/presentation/splash_screen.dart';

import '../config/theme/app_theme.dart';
import '../di/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        SplashScreen.route: (context) => SplashScreen(),
        "/": (context) => MainWrapper(),
      },
    );
  }
}
