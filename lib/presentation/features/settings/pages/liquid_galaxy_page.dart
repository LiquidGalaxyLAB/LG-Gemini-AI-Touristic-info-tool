import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../service/lg_service.dart';
import '../panels/control_panel.dart';
import '../panels/status_panel.dart';

class LiquidGalaxyPage extends StatefulWidget {
  const LiquidGalaxyPage({super.key});

  @override
  State<LiquidGalaxyPage> createState() => _LiquidGalaxyPageState();
}

class _LiquidGalaxyPageState extends State<LiquidGalaxyPage> {
  bool _connected = false;
  static const double spacing = 12.0;

  @override
  void initState() {
    super.initState();
    _isConnected();
  }

  void _isConnected() async {
    final connected = await LGService().isConnected();
    setState(() {
      _connected = connected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacing),
      color: AppTheme.gray.shade900,
      child: Row(
        children: [
          Expanded(
            child: StatusPanel(
              connected: _connected,
              iconData: Icons.settings_remote_rounded,
              title: "Control Liquid Galaxy",
              description:
                  "Control Liquid Galaxy remotely by performing various actions.",
            ),
          ),
          Expanded(
            child: ControlPanel(
              connected: _connected,
            ),
          ),
        ],
      ),
    );
  }
}
