import 'package:flutter/material.dart';

import '../../../../service/lg_service.dart';
import '../widgets/lg_button.dart';

class ControlPanel extends StatefulWidget {
  final bool _connected;
  static const double spacing = 12.0;

  const ControlPanel({
    super.key,
    required bool connected,
  }) : _connected = connected;

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LGButton(
                  label: "Show logo",
                  icon: Icons.slideshow_rounded,
                  onPressed: LGService().showLogo,
                  enabled: widget._connected,
                  styleSmall: true,
                ),
                LGButton(
                  label: "Hide logo",
                  icon: Icons.cancel_presentation_rounded,
                  onPressed: LGService().hideLogo,
                  enabled: widget._connected,
                  styleSmall: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: ControlPanel.spacing),
          LGButton(
            label: "Clear kmls",
            icon: Icons.clean_hands_rounded,
            onPressed: LGService().cleanKml,
            enabled: widget._connected,
          ),
          /// Uncomment if want slave refresh & reset slaves feature
          // const SizedBox(height: ControlPanel.spacing),
          // LGButton(
          //   label: "Set slaves refresh",
          //   icon: Icons.av_timer_rounded,
          //   onPressed: LGService().setRefresh,
          //   enabled: widget._connected,
          // ),
          // const SizedBox(height: ControlPanel.spacing),
          // LGButton(
          //   label: "Reset slaves refresh",
          //   icon: Icons.timer_off_outlined,
          //   onPressed: LGService().resetRefresh,
          //   enabled: widget._connected,
          // ),
          const SizedBox(height: ControlPanel.spacing),
          LGButton(
            label: "Relaunch",
            icon: Icons.reset_tv_rounded,
            onPressed: LGService().relaunchLG,
            enabled: widget._connected,
          ),
          const SizedBox(height: ControlPanel.spacing),
          LGButton(
            label: "Reboot",
            icon: Icons.restart_alt_rounded,
            onPressed: LGService().rebootLG,
            enabled: widget._connected,
          ),
          const SizedBox(height: ControlPanel.spacing),
          LGButton(
            label: "Power off",
            icon: Icons.power_settings_new_rounded,
            onPressed: LGService().shutdownLG,
            enabled: widget._connected,
          ),
        ],
      ),
    );
  }
}
