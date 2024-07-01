import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/theme/app_theme.dart';
import '../../core/enums/preferences.dart';
import '../../core/utils/preferences_utils.dart';
import '../../service/lg_service.dart';

class MapsCard extends StatefulWidget {
  final Completer<GoogleMapController> _controller;
  final CameraPosition _cameraPosition;
  const MapsCard({
    super.key,
    required Completer<GoogleMapController> controller,
    required CameraPosition cameraPosition,
  })  : _cameraPosition = cameraPosition,
        _controller = controller;

  @override
  State<MapsCard> createState() => MapsCardState();
}

class MapsCardState extends State<MapsCard> {
  LGService? lgService;

  @override
  void initState() {
    super.initState();
    _initializeMembers();
  }

  void _initializeMembers() async {
    final PreferencesUtils preferencesUtils = PreferencesUtils();
    String username = (await preferencesUtils.getValue(ConnectionPreferences.username.name)) ?? "";
    String password = (await preferencesUtils.getValue(ConnectionPreferences.password.name)) ?? "";
    String ip = (await preferencesUtils.getValue(ConnectionPreferences.ip.name)) ?? "";
    String port = (await preferencesUtils.getValue(ConnectionPreferences.port.name)) ?? "0";
    String screens = (await preferencesUtils.getValue(ConnectionPreferences.screens.name)) ?? "0";

    lgService = LGService(
      host: ip,
      port: int.parse(port),
      username: username,
      password: password,
      slaves: int.parse(screens),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: GoogleMap(
        mapType: AppTheme.mapStyle,
        style: AppTheme.mapTheme,
        initialCameraPosition: widget._cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          widget._controller.complete(controller);
        },
        onCameraMove: (cameraPosition) {
          lgService?.flyTo(cameraPosition);
        },
      ),
    );
  }
}
