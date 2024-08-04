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

  final bool _shouldShowTourButton;

  final Function()? _onOrbitButtonTap;
  final Function()? _onTourButtonTap;

  const MapsCard({
    super.key,
    required Completer<GoogleMapController> controller,
    required CameraPosition cameraPosition,
    Set<Marker> markers = const {},
    Set<Polygon> polygons = const {},
    Set<Polyline> polylines = const {},
    Set<Circle> circles = const {},
    bool shouldShowTourButton = false,
    Function()? onOrbitButtonTap,
    Function()? onTourButtonTap,
  })  : _shouldShowTourButton = shouldShowTourButton,
        _onOrbitButtonTap = onOrbitButtonTap,
        _onTourButtonTap = onTourButtonTap,
        _markers = markers,
        _circles = circles,
        _polygons = polygons,
        _polylines = polylines,
        _cameraPosition = cameraPosition,
        _controller = controller;

  @override
  State<MapsCard> createState() => MapsCardState();
}

class MapsCardState extends State<MapsCard> {
  Color tourIconColor = AppTheme.color.shade600;
  Color orbitIconColor = AppTheme.color.shade600;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.gray.shade800,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            GoogleMap(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(AppTheme.color.shade700),
                      ),
                      highlightColor: AppTheme.color.shade500,
                      onPressed: widget._onOrbitButtonTap,
                      icon: Icon(
                        Icons.public_rounded,
                        size: 20,
                        color: AppTheme.color.shade50,
                      ),
                    ),
                    if (widget._shouldShowTourButton) const SizedBox(height: 8.0),
                    if (widget._shouldShowTourButton)
                    IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(AppTheme.color.shade700),
                      ),
                      highlightColor: AppTheme.color.shade500,
                      onPressed: widget._onTourButtonTap,
                      icon: Icon(
                        Icons.tour,
                        size: 20,
                        color: AppTheme.color.shade50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
