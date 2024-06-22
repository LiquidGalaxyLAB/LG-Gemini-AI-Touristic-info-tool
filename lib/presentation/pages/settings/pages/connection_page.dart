import 'package:flutter/material.dart';

import '../../../../config/theme/app_theme.dart';
import '../../../../service/lg_service.dart';
import '../panels/input_panel.dart';
import '../panels/status_panel.dart';

const String connect = "Connect";
const String disconnect = "Disconnect";

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  static const double spacing = 12.0;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController slavesController = TextEditingController();

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
    return Container(
      padding: const EdgeInsets.all(spacing),
      color: AppTheme.gray.shade900,
      child: Row(
        children: [
          Expanded(
            child: StatusPanel(
              connected: _connected,
              iconData: Icons.connect_without_contact_rounded,
              title: "Establish Connection with LG",
              description:
                  "We will establish a connection with Liquid Galaxy to display data.",
            ),
          ),
          Expanded(
            child: InputPanel(
              userController: userController,
              passController: passController,
              ipController: ipController,
              portController: portController,
              slavesController: slavesController,
              onPressed: _connectToLiquidGalaxy,
              connected: _connected,
            ),
          ),
        ],
      ),
    );
  }

  bool _isValidData() {
    return ipController.text.isNotEmpty &&
        portController.text.isNotEmpty &&
        userController.text.isNotEmpty &&
        passController.text.isNotEmpty &&
        slavesController.text.isNotEmpty &&
        int.parse(slavesController.text) > 0;
  }

  Future<void> _connectToLiquidGalaxy() async {
    if (!_isValidData()) {
      showSnackBar("empty data");
      return;
    }

    final lgService = LGService(
      host: ipController.text,
      port: int.parse(portController.text),
      username: userController.text,
      password: passController.text,
      slaves: int.parse(slavesController.text),
    );

    final result = await lgService.connect();
    if (result) {
      _isConnected();
      showSnackBar("successful");
    } else {
      _isConnected();
      showSnackBar("failed");
    }
  }

  void showSnackBar(String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
