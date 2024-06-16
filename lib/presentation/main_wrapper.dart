import 'package:flutter/material.dart';

import '../config/routes/app_routes.dart';
import 'widgets/side_bar.dart';

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
      body: Row(
        children: [
          SideBar(
            navigatorKey: _navigatorKey,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
              ),
              child: _content(),
            ),
          )
        ],
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
