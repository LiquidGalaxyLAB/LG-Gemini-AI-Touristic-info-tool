import 'dart:io';

import 'package:flutter/material.dart';
import 'package:touristic/config/theme/app_theme.dart';
import 'package:touristic/presentation/main_wrapper.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(Duration(milliseconds: 0), () {
    Navigator.of(context).pushReplacementNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray.shade900,
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyanAccent),
        ),
      ),
    );

  }
}
