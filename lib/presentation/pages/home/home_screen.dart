import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touristic/core/constants/constants.dart';
import 'package:touristic/presentation/widgets/item_card_dashboard.dart';

import '../../../config/routes/app_routes.dart';
import '../../../config/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;

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
    final mediaQuery = MediaQuery.of(context);
    final list = _getDashboardItems();

    return Container(
      color: AppTheme.blue80,
      padding: EdgeInsets.only(top: mediaQuery.viewPadding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Liquid Galaxy",
              style: TextStyle(
                color: AppTheme.gray10,
                fontFamily: "Noto",
                fontSize: 14,
                fontWeight: FontWeight.w800
              ),
              textAlign: TextAlign.start,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Touristic AI",
              style: TextStyle(
                color: AppTheme.gray10,
                fontFamily: "Noto",
                  fontSize: 20,
                  fontWeight: FontWeight.w800
              ),
              textAlign: TextAlign.start,
            ),
          ),

          SizedBox(height: 10,),
          ..._getDashboardItems()
        ],
      ),
    );
  }

  List<Widget> _getDashboardItems() {
    final List<Widget> items = [];
    final list = dashboardItems.entries.toList();

    for (int i = 0; i < dashboardItems.length; i++) {
      items.add(
          Material(
            color: AppTheme.blue80,
            child: InkWell(
              splashColor: AppTheme.blue70,
              onTap: () {
                setState(() {
                  _selected = i;
                });
              },
              child: ItemCardDashboard(
                title: list[i].key,
                iconData: list[i].value,
                selected: _selected == i,
              ),
            ),
          )
      );
    }

    return items;
  }

  Widget _content() {
    return const Navigator(
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
