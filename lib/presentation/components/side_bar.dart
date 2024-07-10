import 'package:flutter/material.dart';

import '../../config/routes/app_routes.dart';
import '../../config/theme/app_theme.dart';
import '../../core/constants/constants.dart';
import '../../core/enums/app_feature.dart';

class SideBar extends StatefulWidget {
  final GlobalKey<NavigatorState> _navigatorKey;

  const SideBar({
    super.key,
    required GlobalKey<NavigatorState> navigatorKey,
  }) : _navigatorKey = navigatorKey;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _expanded = true;
  AppFeature _selected = AppFeature.chat;
  final items = dashboardItems.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.gray.shade1000,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            icon: Icon(
              _expanded ? Icons.close_rounded : Icons.menu_rounded,
              color: AppTheme.gray.shade200,
              size: 28,
            ),
          ),
          const SizedBox(height: 12.0),
          _sideBarItems(),
        ],
      ),
    );
  }

  Widget _sideBarItems() {
    final List<Widget> items = [];
    final list = dashboardItems.entries.toList();

    for (int i = 0; i < dashboardItems.length; i++) {
      items.add(_buildSideBarItem(
        title: list[i].key,
        iconData: list[i].value,
        selected: i == _selected.index,
        expanded: _expanded,
        onTap: () {
          if (i != _selected.index) {
            Navigator.pushReplacementNamed(
              widget._navigatorKey.currentContext!,
              AppRoutes.routeMap[i]!,
            );
            setState(() {
              _selected = AppFeature.values[i];
            });
          }
        },
      ));
    }

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: items,
    ));
  }

  Widget _buildSideBarItem({
    required String title,
    required IconData iconData,
    required bool selected,
    required bool expanded,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color:
                    selected ? AppTheme.color.shade700 : AppTheme.gray.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                iconData,
                size: 18,
                color:
                    selected ? AppTheme.gray.shade200 : AppTheme.gray.shade400,
              ),
            ),
            if (expanded)
              const SizedBox(
                width: 10,
              ),
            if (expanded)
              Text(
                title,
                style: TextStyle(
                  color: selected
                      ? AppTheme.gray.shade200
                      : AppTheme.gray.shade400,
                  fontWeight: FontWeight.w700,
                ),
              )
          ],
        ),
      ),
    );
  }
}
