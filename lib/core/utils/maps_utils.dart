import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<void> moveToPlace(
  Completer<GoogleMapController> mapController,
  LatLng latLng, {
  double zoom = 15.0,
  double tilt = 0.0,
}) async {
  final GoogleMapController controller = await mapController.future;
  await controller.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(target: latLng, zoom: zoom, tilt: tilt),
    ),
  );
}
