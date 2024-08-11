import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../config/routes/app_routes.dart';
import '../config/theme/app_theme.dart';
import '../core/constants/constants.dart';
import '../core/enums/preferences.dart';
import '../core/utils/preferences_utils.dart';
import '../service/lg_service.dart';
import 'components/side_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _loadLocalPreferences();
  }

  void _loadLocalPreferences() async {
    int connectionMethod = await PreferencesUtils().getValue<int>(GeneralPreferences.connectionMethod.name) ?? 1;
    if (connectionMethod == 0) {
      _connectToLg();
    }
  }

  void _connectToLg() async {
    final PreferencesUtils preferencesUtils = PreferencesUtils();
    String username = (await preferencesUtils.getValue(ConnectionPreferences.username.name)) ?? "";
    String password = (await preferencesUtils.getValue(ConnectionPreferences.password.name)) ?? "";
    String ip = (await preferencesUtils.getValue(ConnectionPreferences.ip.name)) ?? "";
    String port = (await preferencesUtils.getValue(ConnectionPreferences.port.name)) ?? "";
    String screens = (await preferencesUtils.getValue(ConnectionPreferences.screens.name)) ?? "";

    if (username.isNotEmpty && password.isNotEmpty && ip.isNotEmpty && port.isNotEmpty && screens.isNotEmpty) {
      LGService().init(
        onError: (data) {
          _showSnackbar(data);
        },
        host: ip,
        port: int.parse(port),
        username: username,
        password: password,
        slaves: int.parse(screens),
      );

      final result = await LGService().connect();
      if (result) {
        firstTimeConnected = true;
        shouldTryReconnecting = true;
        _showSnackbar("Connected Automatically");

        await LGService().showLogo();
        await LGService().flyTo(
          const CameraPosition(
            target: LatLng(
              22.99899294474381,
              78.7274369224906,
            ),
            zoom: 3,
          ),
        );
      }
    }
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: AppTheme.gray.shade300,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: AppTheme.gray.shade800,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray.shade800,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top,
        ),
        child: Row(
          children: [
            SideBar(
              navigatorKey: _navigatorKey,
            ),
            Expanded(
              child: Container(
                color: AppTheme.gray.shade900,
                child: _content(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
