import 'package:flutter/material.dart';

import '../../../config/theme/app_theme.dart';
import '../../../service/lg_service.dart';
import 'widget/input_field.dart';

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
          Container(),
          _buildInputPanel()
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

  Widget _buildSidePanel() {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'Establish connection with LG',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
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
      ],
    );
  }

  Widget _buildInputPanel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InputField(
          label: "Username",
          hint: "lg",
          controller: userController,
          type: TextInputType.name,
          prefixIcon: Icons.person_rounded,
        ),
        const SizedBox(height: spacing),
        InputField(
          label: "Password",
          hint: "lg",
          controller: passController,
          type: TextInputType.visiblePassword,
          prefixIcon: Icons.key_rounded,
          suffixIcons: const [
            Icons.visibility_rounded,
            Icons.visibility_off_rounded,
          ],
        ),
        const SizedBox(height: spacing),
        InputField(
          label: "IP Address",
          hint: "192.168.0.1",
          controller: ipController,
          type: TextInputType.phone,
          prefixIcon: Icons.router_rounded,
        ),
        const SizedBox(height: spacing),
        InputField(
          label: "Port Number",
          hint: "22",
          controller: portController,
          type: TextInputType.number,
          prefixIcon: Icons.account_tree_rounded,
        ),
        const SizedBox(height: spacing),
        InputField(
          label: "Total Screens",
          hint: "3",
          controller: slavesController,
          type: TextInputType.number,
          prefixIcon: Icons.smart_screen_rounded,
        ),
        const SizedBox(height: 28),
        Align(
          alignment: Alignment.center,
          child: FilledButton(
            onPressed: _connectToLiquidGalaxy,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              _connected ? disconnect : connect,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }
}
