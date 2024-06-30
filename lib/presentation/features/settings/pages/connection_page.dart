import 'package:flutter/material.dart';
import 'package:touristic/core/enums/preferences.dart';
import 'package:touristic/core/utils/preferences_utils.dart';

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
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController slavesController = TextEditingController();

  bool _connected = false;

  @override
  void initState() {
    super.initState();
    _isConnected();
    _loadPreferences();
  }

  void _loadPreferences() async {
    final PreferencesUtils preferencesUtils = PreferencesUtils();
    userController = TextEditingController(text: await preferencesUtils.getValue(ConnectionPreferences.username.name));
    passController = TextEditingController(text: await preferencesUtils.getValue(ConnectionPreferences.password.name));
    ipController = TextEditingController(text: await preferencesUtils.getValue(ConnectionPreferences.ip.name));
    portController = TextEditingController(text: await preferencesUtils.getValue(ConnectionPreferences.port.name));
    slavesController = TextEditingController(text: await preferencesUtils.getValue(ConnectionPreferences.screens.name));
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
              description: "We will establish a connection with Liquid Galaxy to display data.",
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
      final PreferencesUtils preferencesUtils = PreferencesUtils();
      preferencesUtils.updateValue(ConnectionPreferences.username.name, userController.text);
      preferencesUtils.updateValue(ConnectionPreferences.password.name, passController.text);
      preferencesUtils.updateValue(ConnectionPreferences.ip.name, ipController.text);
      preferencesUtils.updateValue(ConnectionPreferences.port.name, portController.text);
      preferencesUtils.updateValue(ConnectionPreferences.screens.name, slavesController.text);
    } else {
      _isConnected();
      showSnackBar("failed");
    }
  }

  void showSnackBar(String msg) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: TextStyle(
          color: AppTheme.gray.shade300,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: AppTheme.gray.shade800,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
