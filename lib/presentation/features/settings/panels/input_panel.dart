import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../widgets/input_field.dart';

class InputPanel extends StatefulWidget {
  static const double spacing = 12.0;
  final TextEditingController _userController;
  final TextEditingController _passController;
  final TextEditingController _ipController;
  final TextEditingController _portController;
  final TextEditingController _slavesController;

  final Function _onPressed;
  final bool _connected;

  const InputPanel({
    super.key,
    required TextEditingController userController,
    required TextEditingController passController,
    required TextEditingController ipController,
    required TextEditingController portController,
    required TextEditingController slavesController,
    required Function onPressed,
    required bool connected,
  })  : _onPressed = onPressed,
        _slavesController = slavesController,
        _portController = portController,
        _ipController = ipController,
        _passController = passController,
        _userController = userController,
        _connected = connected;

  @override
  State<InputPanel> createState() => _InputPanelState();
}

class _InputPanelState extends State<InputPanel> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputField(
            label: "Username",
            hint: "lg",
            controller: widget._userController,
            type: TextInputType.name,
            prefixIcon: Icons.person_rounded,
          ),
          const SizedBox(height: InputPanel.spacing),
          InputField(
            label: "Password",
            hint: "lg",
            controller: widget._passController,
            type: TextInputType.visiblePassword,
            prefixIcon: Icons.key_rounded,
            suffixIcons: const [
              Icons.visibility_rounded,
              Icons.visibility_off_rounded,
            ],
          ),
          const SizedBox(height: InputPanel.spacing),
          InputField(
            label: "IP Address",
            hint: "192.168.0.1",
            controller: widget._ipController,
            type: TextInputType.phone,
            prefixIcon: Icons.router_rounded,
          ),
          const SizedBox(height: InputPanel.spacing),
          InputField(
            label: "Port Number",
            hint: "22",
            controller: widget._portController,
            type: TextInputType.number,
            prefixIcon: Icons.account_tree_rounded,
          ),
          const SizedBox(height: InputPanel.spacing),
          InputField(
            label: "Total Screens",
            hint: "3",
            controller: widget._slavesController,
            type: TextInputType.number,
            prefixIcon: Icons.smart_screen_rounded,
          ),
          const SizedBox(height: 28),
          FilledButton(
            onPressed: () async {
              if (!_loading) {
                setState(() {
                  _loading = true;
                });
                await widget._onPressed();
                setState(() {
                  _loading = false;
                });
              }
            },
            style: FilledButton.styleFrom(
              fixedSize: const Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppTheme.color.shade700,
            ),
            child: !_loading
                ? Text(
                    widget._connected ? "Disconnect" : "Connect",
                    style: TextStyle(
                      color: AppTheme.gray.shade200,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppTheme.color.shade50,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 3,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
