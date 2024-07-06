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
  final TextEditingController _userController = TextEditingController(text: '');
  final TextEditingController _passController = TextEditingController(text: '');
  final TextEditingController _ipController = TextEditingController(text: '');
  final TextEditingController _portController = TextEditingController(text: '');
  final TextEditingController _slavesController = TextEditingController(text: '');

  bool _connected = false;

  @override
  void initState() {
    super.initState();
    _isConnected();
    _loadPreferences();
  }

  void _loadPreferences() async {
    final PreferencesUtils preferencesUtils = PreferencesUtils();
    _userController.text = await preferencesUtils.getValue<String>(ConnectionPreferences.username.name) ?? "";
    _passController.text = await preferencesUtils.getValue<String>(ConnectionPreferences.password.name) ?? "";
    _ipController.text = await preferencesUtils.getValue<String>(ConnectionPreferences.ip.name) ?? "";
    _portController.text = await preferencesUtils.getValue<String>(ConnectionPreferences.port.name) ?? "";
    _slavesController.text = await preferencesUtils.getValue<String>(ConnectionPreferences.screens.name) ?? "";

    LGService().init(
      onError: (data) {
        showSnackBar(data);
      },
      host: _ipController.text,
      port: int.parse(_portController.text),
      username: _userController.text,
      password: _passController.text,
      slaves: int.parse(_slavesController.text),
    );
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
              iconData: Icons.connect_without_contact_rounded,
              title: "Establish Connection with LG",
              description: "We will establish a connection with Liquid Galaxy to display data.",
            ),
          ),
          Expanded(
            child: InputPanel(
              userController: _userController,
              passController: _passController,
              ipController: _ipController,
              portController: _portController,
              slavesController: _slavesController,
              onPressed: () {
                if (_connected) {
                  LGService().disconnect();
                  _isConnected();
                } else {
                  _connectToLiquidGalaxy();
                }
              },
              connected: _connected,
            ),
          ),
        ],
      ),
    );
  }

  bool _isValidData() {
    return _ipController.text.isNotEmpty &&
        _portController.text.isNotEmpty &&
        _userController.text.isNotEmpty &&
        _passController.text.isNotEmpty &&
        _slavesController.text.isNotEmpty &&
        int.parse(_slavesController.text) > 0;
  }

  Future<void> _connectToLiquidGalaxy() async {
    if (!_isValidData()) {
      showSnackBar("empty data");
      return;
    }

    LGService().init(
      onError: (data) {
        showSnackBar(data);
      },
      host: _ipController.text,
      port: int.parse(_portController.text),
      username: _userController.text,
      password: _passController.text,
      slaves: int.parse(_slavesController.text),
    );

    final result = await LGService().connect();
    if (result) {
      _isConnected();
      showSnackBar("Connection successful");
      final PreferencesUtils preferencesUtils = PreferencesUtils();
      preferencesUtils.updateValue(ConnectionPreferences.username.name, _userController.text);
      preferencesUtils.updateValue(ConnectionPreferences.password.name, _passController.text);
      preferencesUtils.updateValue(ConnectionPreferences.ip.name, _ipController.text);
      preferencesUtils.updateValue(ConnectionPreferences.port.name, _portController.text);
      preferencesUtils.updateValue(ConnectionPreferences.screens.name, _slavesController.text);
    } else {
      _isConnected();
      showSnackBar("Connection failed");
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
