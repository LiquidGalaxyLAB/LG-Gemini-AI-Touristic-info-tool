import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/theme/app_theme.dart';
import '../../service/lg_service.dart';

class MapsCard extends StatefulWidget {
  final Completer<GoogleMapController> _controller;
  final CameraPosition _cameraPosition;
  final Set<Marker> _markers;
  final Set<Polygon> _polygons;
  final Set<Polyline> _polylines;
  final Set<Circle> _circles;

  const MapsCard({
    super.key,
    required Completer<GoogleMapController> controller,
    required CameraPosition cameraPosition,
    Set<Marker> markers = const {},
    Set<Polygon> polygons = const {},
    Set<Polyline> polylines = const {},
    Set<Circle> circles = const {},
  })  : _markers = markers,
        _circles = circles,
        _polygons = polygons,
        _polylines = polylines,
        _cameraPosition = cameraPosition,
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
        markers: widget._markers,
        polygons: widget._polygons,
        polylines: widget._polylines,
        circles: widget._circles,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        tiltGesturesEnabled: true,
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
