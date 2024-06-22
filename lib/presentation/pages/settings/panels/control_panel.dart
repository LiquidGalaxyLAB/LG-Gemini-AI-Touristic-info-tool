import 'package:flutter/material.dart';

import '../../../../service/lg_service.dart';
import '../widgets/lg_button.dart';

class ControlPanel extends StatelessWidget {
  final bool _connected;
  static const double spacing = 12.0;

  const ControlPanel({
    super.key,
    required bool connected,
  }) : _connected = connected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LGButton(
          label: "Set slaves refresh",
          icon: Icons.av_timer_rounded,
          onPressed: () {
            LGService.instance?.setRefresh();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Reset slaves refresh",
          icon: Icons.timer_off_outlined,
          onPressed: () {
            LGService.instance?.resetRefresh();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Relaunch",
          icon: Icons.reset_tv_rounded,
          onPressed: () {
            LGService.instance?.rebootLG();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Reboot",
          icon: Icons.restart_alt_rounded,
          onPressed: () {
            LGService.instance?.rebootLG();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Power off",
          icon: Icons.power_settings_new_rounded,
          onPressed: () {
            LGService.instance?.shutdownLG();
          },
          enabled: _connected,
        ),
      ],
    );
  }
}
