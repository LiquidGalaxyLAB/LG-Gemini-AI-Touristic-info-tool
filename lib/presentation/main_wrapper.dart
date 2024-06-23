import 'package:flutter/material.dart';

import '../config/routes/app_routes.dart';
import '../config/theme/app_theme.dart';
import 'components/side_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray.shade800,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
        ),
        child: Row(
          children: [
            Container(
              color: AppTheme.gray.shade900,
              child: SideBar(
                navigatorKey: _navigatorKey,
              ),
            ),
            Expanded(
              child: Container(
                color: AppTheme.gray.shade900,
                child: _content(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
