import 'package:equatable/equatable.dart';

import '../../config/theme/app_theme.dart';
import "../../core/utils/data_utils.dart";
import '../../core/utils/html_utils.dart';

class TouristPlace extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String history;
  final String significance;
  final String cuisine;
  final String specialty;
  final String location;

  const TouristPlace({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.history,
    required this.significance,
    required this.cuisine,
    required this.specialty,
    required this.location,
  });

  @override
  List<Object?> get props => [name, latitude, longitude, history, significance, cuisine, specialty, location];
}

String createUnorderedList(List<String> items) {
  return '<ul>${items.map((item) => '<li>$item</li>').join()}</ul>';
}

String _createTouristPlaceCard(TouristPlace place) {
  return '${createSectionCard('Name', place.name, level: 1)}'
      '${createSectionCard('Coordinates', '${place.latitude}, ${place.longitude}', level: 1)}'
      '${createSectionCard('History', place.history, level: 1)}'
      '${createSectionCard('Significance', place.significance, level: 1)}'
      '${createSectionCard('Cuisine', place.cuisine, level: 1)}'
      '${createSectionCard('Specialty', place.specialty, level: 1)}'
      '${createSectionCard('Location', place.location, level: 1)}';
}

extension GenerateTouristPlaceBalloon on TouristPlace {
  String generateBalloon() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Tourist Place Data</name>
      <Style id="tourist_place_style">
        <BalloonStyle>
          <textColor>#ffff0000</textColor>
          <bgColor>${AppTheme.color.shade50.toHex()}</bgColor> <!-- Set the balloon background color here -->
          <text>
            <![CDATA[
            <font size="+2">
              ${createHeading(name)}
              ${createSectionCard("Tourist Place Details", _createTouristPlaceCard(this))}
            </font>
            ]]>
          </text>
          <bgColor>${AppTheme.color.shade200.toHex()}</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description><![CDATA[]]></description>
        <styleUrl>#tourist_place_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>$longitude,$latitude,0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }
}
