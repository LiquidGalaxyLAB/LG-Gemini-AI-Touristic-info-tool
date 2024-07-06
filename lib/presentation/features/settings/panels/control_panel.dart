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
          label: "Show/Hide logo",
          icon: Icons.slideshow_rounded,
          onPressed: () {
            LGService().showLogo();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Clear kmls",
          icon: Icons.clean_hands_rounded,
          onPressed: () {
            LGService().cleanKml();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Set slaves refresh",
          icon: Icons.av_timer_rounded,
          onPressed: () {
            LGService().setRefresh();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Reset slaves refresh",
          icon: Icons.timer_off_outlined,
          onPressed: () {
            LGService().resetRefresh();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Relaunch",
          icon: Icons.reset_tv_rounded,
          onPressed: () {
            LGService().relaunchLG();
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Reboot",
          icon: Icons.restart_alt_rounded,
          onPressed: () {
            LGService().rebootLG();
            Future.delayed(const Duration(seconds: 10), () {
              LGService().connect();
            });
          },
          enabled: _connected,
        ),
        const SizedBox(height: spacing),
        LGButton(
          label: "Power off",
          icon: Icons.power_settings_new_rounded,
          onPressed: () {
            LGService().shutdownLG();
          },
          enabled: _connected,
        ),
      ],
    );
  }
}
