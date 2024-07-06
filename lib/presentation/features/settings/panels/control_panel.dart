import 'package:flutter/material.dart';
import 'package:touristic/core/utils/preferences_utils.dart';

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
  bool _showLogo = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _showLogo = (await PreferencesUtils().getValue<bool>("show_logo")) ?? true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LGButton(
          label: _showLogo ? "Hide logo" : "Show logo",
          icon: Icons.slideshow_rounded,
          onPressed: () {
            if (_showLogo) {
              LGService().hideLogo();
            } else {
              LGService().showLogo();
            }
            setState(() {
              _showLogo = !_showLogo;
            });
            PreferencesUtils().updateValue("show_logo", _showLogo);
          },
          enabled: widget._connected,
        ),
        const SizedBox(height: ControlPanel.spacing),
        LGButton(
          label: "Clear kmls",
          icon: Icons.clean_hands_rounded,
          onPressed: () {
            LGService().cleanKml();
          },
          enabled: widget._connected,
        ),
        const SizedBox(height: ControlPanel.spacing),
        LGButton(
          label: "Set slaves refresh",
          icon: Icons.av_timer_rounded,
          onPressed: () {
            LGService().setRefresh();
          },
          enabled: widget._connected,
        ),
        const SizedBox(height: ControlPanel.spacing),
        LGButton(
          label: "Reset slaves refresh",
          icon: Icons.timer_off_outlined,
          onPressed: () {
            LGService().resetRefresh();
          },
          enabled: widget._connected,
        ),
        const SizedBox(height: ControlPanel.spacing),
        LGButton(
          label: "Relaunch",
          icon: Icons.reset_tv_rounded,
          onPressed: () {
            LGService().relaunchLG();
          },
          enabled: widget._connected,
        ),
        const SizedBox(height: ControlPanel.spacing),
        LGButton(
          label: "Reboot",
          icon: Icons.restart_alt_rounded,
          onPressed: () {
            LGService().rebootLG();
            Future.delayed(const Duration(seconds: 10), () {
              LGService().connect();
            });
          },
          enabled: widget._connected,
        ),
        const SizedBox(height: ControlPanel.spacing),
        LGButton(
          label: "Power off",
          icon: Icons.power_settings_new_rounded,
          onPressed: () {
            LGService().shutdownLG();
          },
          enabled: widget._connected,
        ),
      ],
    );
  }
}
