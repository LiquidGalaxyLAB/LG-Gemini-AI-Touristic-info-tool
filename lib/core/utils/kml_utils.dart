import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class KmlUtils {
  static String lookAt(
    CameraPosition cameraPosition, {
    double? zoom,
  }) {
    zoom ??= 156543.03392 * cos(cameraPosition.target.latitude * pi / 180) / pow(2.0, cameraPosition.zoom.toDouble()) * 1000;
    return """
    <LookAt>
      <longitude>${cameraPosition.target.longitude}</longitude>
      <latitude>${cameraPosition.target.latitude}</latitude>
      <range>$zoom</range>
      <tilt>${cameraPosition.tilt}</tilt>
      <heading>${cameraPosition.bearing}</heading>
      <gx:altitudeMode>relativeToGround</gx:altitudeMode>
    </LookAt>""";
  }

  static String orbitAround(CameraPosition cameraPosition) {
    int heading = 0;
    String tags = "";

    for (var i = 0; i <= 36; i++) {
      heading += 10;
      tags += """
      <gx:FlyTo>
        <gx:duration>1.2</gx:duration>
        <gx:flyToMode>smooth</gx:flyToMode>
        <LookAt>
          <longitude>${cameraPosition.target.longitude}</longitude>
          <latitude>${cameraPosition.target.latitude}</latitude>
          <heading>$heading</heading>
          <tilt>60</tilt>
          <range>2000</range>
          <gx:fovy>60</gx:fovy>
          <altitude>3341.7995674</altitude>
          <gx:altitudeMode>absolute</gx:altitudeMode>
        </LookAt>
      </gx:FlyTo>""";
    }

    return """<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">  
      <gx:Tour>
        <name>TouristicOrbit</name>
        <gx:Playlist>$tags}</gx:Playlist>
      </gx:Tour>
    </kml>""";
  }
}
