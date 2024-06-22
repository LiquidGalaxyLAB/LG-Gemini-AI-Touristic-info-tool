import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import 'connection_page.dart';
import 'general_settings_page.dart';
import 'liquid_galaxy_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          color: AppTheme.gray.shade800,
          child: TabBar(
            dividerHeight: 0,
            padding: EdgeInsets.zero,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
              insets: const EdgeInsets.symmetric(horizontal: 60),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: AppTheme.color.shade700,
                width: 4.0
              )
            ),
            labelColor: AppTheme.gray.shade200,
            unselectedLabelColor: AppTheme.gray.shade400,
            tabs: [
              _buildTab(
                Icons.settings_accessibility_rounded,
                "General",
                _tabController.index == 0,
              ),
              _buildTab(
                Icons.connected_tv_rounded,
                "Connection",
                _tabController.index == 1,
              ),
              _buildTab(
                Icons.adb_rounded,
                "Liquid Galaxy",
                _tabController.index == 2,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: AppTheme.gray.shade900,
        padding: const EdgeInsets.only(top: 48),
        child: TabBarView(
          controller: _tabController,
          children: const [
            ConnectionPage(),
            GeneralSettingsPage(),
            LiquidGalaxyPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
    IconData iconData,
    String title,
    bool selected,
  ) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 16,
            color: selected ? AppTheme.color.shade200 : AppTheme.gray.shade400,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:
                  selected ? AppTheme.color.shade200 : AppTheme.gray.shade400,
            ),
          ),
        ],
      ),
    );
  }
}