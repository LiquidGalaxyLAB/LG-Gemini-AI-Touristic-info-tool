import 'package:flutter/material.dart';
import 'package:touristic/core/constants/constants.dart';
import 'package:touristic/presentation/widgets/item_card_dashboard.dart';

import '../../../config/routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 25,
            child: _dashboard(),
          ),
          Flexible(
            flex: 100,
            child: _content(),
          )
        ],
      ),
    );
  }

  Widget _dashboard() {
    return ListView(
      children: dashboardItems.entries.map((entry) {
        return ItemCardDashboard(
          title: entry.key,
          iconData: entry.value,
        );
      }).toList(),
    );
  }

  Widget _content() {
    return const Navigator(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
