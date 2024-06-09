import 'package:flutter/material.dart';
import 'package:touristic/core/constants/constants.dart';
import 'package:touristic/presentation/widgets/item_card_dashboard.dart';

import '../../../config/routes/app_routes.dart';
import '../../../config/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _selected = 0;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _dashboard(),
          Expanded(
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
      padding: EdgeInsets.only(
          top: mediaQuery.viewPadding.top, right: _expanded ? 8 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Icon(
                Icons.menu_open_rounded,
                color: AppTheme.gray10,
                size: 28,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Liquid Galaxy",
                style: TextStyle(
                    color: AppTheme.gray10,
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.start,
              ),
            ),
          if (_expanded)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Touristic AI",
                style: TextStyle(
                    color: AppTheme.gray10,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.start,
              ),
            ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Material(
                color: AppTheme.blue80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _getDashboardItems(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  List<Widget> _getDashboardItems() {
    final List<Widget> items = [];
    final list = dashboardItems.entries.toList();

    for (int i = 0; i < dashboardItems.length; i++) {
      items.add(InkWell(
        splashColor: AppTheme.blue70,
        onTap: () {
          if (_selected != i) {
            if (list[i].key == "Settings") {
              Navigator.pushNamed(
                  _navigatorKey.currentContext!, AppRoutes.settings);
            }
            setState(() { 
              _selected = i;
            });
          }
        },
        child: ItemCardDashboard(
          title: list[i].key,
          iconData: list[i].value,
          selected: _selected == i,
          expanded: _expanded,
        ),
      ));
    }

    return items;
  }

  Widget _content() {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
