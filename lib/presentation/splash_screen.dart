import 'package:flutter/material.dart';

import '../config/theme/app_theme.dart';

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
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacementNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.gray.shade900,
      padding: EdgeInsets.only(
        top: 16.0 + MediaQuery.of(context).viewPadding.top,
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Image.asset(
        "assets/images/img_splash.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
