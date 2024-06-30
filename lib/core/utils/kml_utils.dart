import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class KmlUtils {
  static String lookAt(CameraPosition cameraPosition) {
    double zoom = 156543.03392 * cos(cameraPosition.target.latitude * pi / 180) / pow(2.0, cameraPosition.zoom.toDouble());
    return """<LookAt>
      <longitude>${cameraPosition.target.longitude}</longitude>
      <latitude>${cameraPosition.target.latitude}</latitude>
      <range>${zoom * 1000}</range>
      <tilt>${cameraPosition.tilt}</tilt>
      <heading>${cameraPosition.bearing}</heading>
      <gx:altitudeMode>relativeToGround</gx:altitudeMode>
    </LookAt>""";
  }
}