import 'package:flutter/material.dart';

import '../../../service/lg_service.dart';
import '../../widgets/lg_button.dart';

class LiquidGalaxyPage extends StatefulWidget {
  const LiquidGalaxyPage({super.key});

  @override
  State<LiquidGalaxyPage> createState() => _LiquidGalaxyPageState();
}

class _LiquidGalaxyPageState extends State<LiquidGalaxyPage> {
  bool _connected = false;

  @override
  void initState() {
    super.initState();
    _isConnected();
  }

  void _isConnected() async {
    final connected = await LGService.isConnected();
    setState(() {
      _connected = connected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Control your system',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _connected ? 'Connected' : 'Disconnected',
            style: TextStyle(
              color: _connected ? Colors.green : Colors.red,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          LGButton(
            label: 'SET SLAVES REFRESH',
            icon: Icons.av_timer_rounded,
            onPressed: () {
              LGService.instance?.setRefresh();
            },
            enabled: _connected,
          ),
          LGButton(
            label: 'RESET SLAVES REFRESH',
            icon: Icons.timer_off_outlined,
            onPressed: () {
              LGService.instance?.resetRefresh();
            },
            enabled: _connected,
          ),
          LGButton(
            label: 'Relaunch',
            icon: Icons.reset_tv_rounded,
            onPressed: () {
              LGService.instance?.rebootLG();
            },
            enabled: _connected,
          ),
          LGButton(
            label: 'Reboot',
            icon: Icons.restart_alt_rounded,
            onPressed: () {
              LGService.instance?.rebootLG();
            },
            enabled: _connected,
          ),
          LGButton(
            label: 'Power off',
            icon: Icons.power_settings_new_rounded,
            onPressed: () {
              LGService.instance?.shutdownLG();
            },
            enabled: _connected,
          ),
        ],
      ),
    );
  }
}
