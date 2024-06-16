import 'package:flutter/material.dart';
import 'package:touristic/presentation/pages/settings/liquid_galaxy_page.dart';

import 'app_settings_page.dart';
import 'connection_page.dart';

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
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: ClipRRect(
            child: Container(
              color: Colors.green.shade100,
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: _buildIndicator(),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                tabs: [
                  _buildTab(
                    Icons.settings_accessibility_rounded,
                    "General",
                  ),
                  _buildTab(
                    Icons.connected_tv_rounded,
                    "Connection",
                  ),
                  _buildTab(
                    Icons.adb_rounded,
                    "Liquid Galaxy",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: TabBarView(
          controller: _tabController,
          children: const [
            AppSettingsPage(),
            ConnectionPage(),
            LiquidGalaxyPage(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildIndicator() {
    switch (_tabController.index) {
      case 0:
        return const BoxDecoration(
          color: Colors.green,
          border: Border(bottom: BorderSide(width: 3, color: Colors.red)),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
          ),
        );
      case 2:
        return const BoxDecoration(
          color: Colors.green,
          border: Border(bottom: BorderSide(width: 3, color: Colors.red)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
        );
      default:
        return const BoxDecoration(
          color: Colors.green,
          border: Border(bottom: BorderSide(width: 3, color: Colors.red)),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        );
    }
  }

  Widget _buildTab(
    IconData iconData,
    String title,
  ) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              iconData,
            size: 18,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style:  const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}
