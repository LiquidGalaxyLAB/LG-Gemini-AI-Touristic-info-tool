import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class KmlUtils {
  static String lookAt(
    CameraPosition cameraPosition, {
    double? zoom,
  }) {
    zoom ??=
        156543.03392 * cos(cameraPosition.target.latitude * pi / 180) / pow(2.0, cameraPosition.zoom.toDouble()) * 1000;
    return """<LookAt><longitude>${cameraPosition.target.longitude}</longitude><latitude>${cameraPosition.target.latitude}</latitude><range>$zoom</range><tilt>${cameraPosition.tilt}</tilt><heading>${cameraPosition.bearing}</heading><gx:altitudeMode>relativeToGround</gx:altitudeMode></LookAt>""";
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

  static String createLogos() {
    return """<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:gx="http://www.google.com/kml/ext/2.2">
      <Document>
        <name>LG Touristic</name>
        <Folder>
          <name>Logo</name>
          <ScreenOverlay>
            <name>Logo</name>
            <Icon><href>https://i.ibb.co/WxGDqrN/img-lg-slave.png</href></Icon>
            <overlayXY x="0" y="1" xunits="fraction" yunits="fraction"/>
            <screenXY x="0.025" y="0.95" xunits="fraction" yunits="fraction"/>
            <rotationXY x="0" y="0" xunits="fraction" yunits="fraction"/>
            <size x="370" y="${300 * 2864 / 3000}" xunits="pixels" yunits="pixels"/>
          </ScreenOverlay>
        </Folder>
      </Document>
    </kml>""";
  }

  static String emptyKml() {
    return """<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
      <Document>
      </Document>
    </kml>""";
  }

  static String createPolyline(
    List<LatLng> coordinates, {
    String lineColor = "ff0000ff",
    int lineThickness = 4,
  }) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2">
      <Document>
        <name>TouristicIA</name>
        <Style id="lineStyle">
          <LineStyle>
            <color>$lineColor</color>
            <width>$lineThickness</width>
          </LineStyle>
        </Style>
        <Placemark>
          <name>TouristicIA</name>
          <styleUrl>#lineStyle</styleUrl>
          <LineString>
            <tessellate>1</tessellate>
            <coordinates>
              ${coordinates.map((e) => '${e.longitude},${e.latitude},0').join('\n')}
            </coordinates>
          </LineString>
        </Placemark>
        ${coordinates.map((e) => _createCircle(e, 100)).join('\n')}
      </Document>
    </kml>''';
  }

  static String createPolygon(
    List<LatLng> coordinates, {
    String lineColor = "ff0000ff",
    String fillColor = "4c0000aa",
    int lineThickness = 4,
  }) {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2">
      <Document>
        <name>TouristicIA</name>
        <Style id="polygonStyle">
          <LineStyle>
            <color>$lineColor</color>
            <width>$lineThickness</width>
          </LineStyle>
          <PolyStyle>
            <color>$fillColor</color>
          </PolyStyle>
        </Style>
        <Placemark>
          <name>TouristicIA</name>
          <styleUrl>#polygonStyle</styleUrl>
          <Polygon>
            <outerBoundaryIs>
              <LinearRing>
                <coordinates>
                  ${coordinates.map((e) => '${e.longitude},${e.latitude},0').join('\n')}
                </coordinates>
              </LinearRing>
            </outerBoundaryIs>
          </Polygon>
        </Placemark>
        ${coordinates.map((e) => _createCircle(e, 100)).join('\n')}
      </Document>
    </kml>''';
  }

  static String _createCircle(
    LatLng latLng,
    double radius, {
    String lineColor = "ff0000ff",
    String fillColor = "4c0000aa",
    int lineThickness = 4,
  }) {
    const int numPoints = 100;
    const double earthRadius = 6371000;

    List<String> coordinates = [];
    for (int i = 0; i <= numPoints; i++) {
      double angle = 2 * pi * i / numPoints;
      double latOffset = radius * cos(angle) / earthRadius;
      double lonOffset = radius * sin(angle) / (earthRadius * cos(latLng.latitude * pi / 180));
      double newLat = latLng.latitude + latOffset * (180 / pi);
      double newLon = latLng.longitude + lonOffset * (180 / pi);
      coordinates.add('$newLon,$newLat,0');
    }

    return '''<Placemark>
      <Style>
        <LineStyle>
          <color>$lineColor</color>
          <width>$lineThickness</width>
        </LineStyle>
        <PolyStyle>
          <color>$fillColor</color>
        </PolyStyle>
      </Style>
      <Polygon>
        <outerBoundaryIs>
          <LinearRing>
            <coordinates>
              ${coordinates.join('\n')}
            </coordinates>
          </LinearRing>
        </outerBoundaryIs>
      </Polygon>
    </Placemark>''';
  }

  static String createCircle(
    LatLng latLng, {
    double radius = 200,
    String lineColor = "ff0000ff",
    String fillColor = "4c0000aa",
    int lineThickness = 4,
  }) {
    const int numPoints = 100;
    const double earthRadius = 6371000;

    List<String> coordinates = [];
    for (int i = 0; i <= numPoints; i++) {
      double angle = 2 * pi * i / numPoints;
      double latOffset = radius * cos(angle) / earthRadius;
      double lonOffset = radius * sin(angle) / (earthRadius * cos(latLng.latitude * pi / 180));
      double newLat = latLng.latitude + latOffset * (180 / pi);
      double newLon = latLng.longitude + lonOffset * (180 / pi);
      coordinates.add('$newLon,$newLat,0');
    }

    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2">
      <Document>
        <name>TouristicIA</name>
        <Placemark>   
          <name>TouristicIA</name>
          <Style>
            <LineStyle>
              <color>$lineColor</color>
              <width>$lineThickness</width>
            </LineStyle>
            <PolyStyle>
              <color>$fillColor</color>
            </PolyStyle>
          </Style>
          <Polygon>
            <outerBoundaryIs>
              <LinearRing>
                <coordinates>
                  ${coordinates.join('\n')}
                </coordinates>
              </LinearRing>
            </outerBoundaryIs>
          </Polygon>
        </Placemark>
      </Document>
    </kml>''';
  }
}
