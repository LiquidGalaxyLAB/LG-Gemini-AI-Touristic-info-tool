import 'package:flutter/material.dart';
import 'package:touristic/core/enums/app_feature.dart';

import '../../config/routes/app_routes.dart';
import '../../config/theme/app_theme.dart';
import '../../core/constants/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Container(
      color: AppTheme.blue80,
      padding: EdgeInsets.only(
        top: mediaQuery.viewPadding.top,
        right: 8,
        left: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _expanded
              ? Container(
                child: _sideBarButton(Icons.close_rounded, () {
                    setState(() {
                      _expanded = false;
                    });
                  }),
              )
              : _sideBarButton(Icons.menu_rounded, () {
                  setState(() {
                    _expanded = true;
                  });
                }),

          const SizedBox(height: 18),

          _sideBarItems(),
        ],
      ),
    );
  }

  Widget _sideBarButton(
    IconData iconData,
    Function onClick,
  ) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Icon(
        iconData,
        color: AppTheme.gray10,
        size: 28,
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
            Navigator.pushNamed(
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
      ),
    );
  }

  Widget _buildSideBarItem({
    required String title,
    required IconData iconData,
    required bool selected,
    required bool expanded,
    required Function onTap,
  }) {
    return InkWell(
      splashColor: AppTheme.blue70,
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
                color: selected ? AppTheme.purple40 : AppTheme.blue70,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                iconData,
                size: 18,
                color: selected ? AppTheme.gray10 : AppTheme.gray10,
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
                  color: selected ? AppTheme.gray10 : AppTheme.gray30,
                  fontFamily: "Noto",
                  fontWeight: FontWeight.w700,
                ),
              )
          ],
        ),
      ),
    );
  }
}
