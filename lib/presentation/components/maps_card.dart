import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/theme/app_theme.dart';
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
          LGService().flyTo(cameraPosition);
        },
      ),
    );
  }
}
