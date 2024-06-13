import 'package:flutter/material.dart';
import 'package:touristic/presentation/pages/settings/liquid_galaxy_page.dart';

import 'connection_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: TabBar(
                tabs: [
              Tab(text:"tab1", icon: Icon(Icons.add)),
              Tab(text:"tab2", icon: Icon(Icons.minimize))
            ]),
          ),
          body: TabBarView(children: [
            ConnectionPage(),
            LiquidGalaxyPage()
          ])
        ),
      )
    );
  }
}
