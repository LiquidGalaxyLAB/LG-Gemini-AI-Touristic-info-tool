import 'package:flutter/material.dart';
import 'package:touristic/presentation/pages/home/home_screen.dart';

import 'config/theme/app_theme.dart';
import 'injection_container.dart';

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
      theme: appTheme(),
      home: const HomeScreen(),
    );
  }
}
