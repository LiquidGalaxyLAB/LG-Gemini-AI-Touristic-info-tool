import 'package:equatable/equatable.dart';

import '../../config/theme/app_theme.dart';
import "../../core/utils/data_utils.dart";
import '../../core/utils/html_utils.dart';

class Itinerary extends Equatable {
  final String name;
  final String startingPoint;
  final List<TravelRoute> travelRoute;
  final List<Place> places;

  const Itinerary({
    required this.name,
    required this.startingPoint,
    required this.travelRoute,
    required this.places,
  });

  @override
  List<Object?> get props => [
        name,
        startingPoint,
        travelRoute,
        places,
      ];
}

class TravelRoute extends Equatable {
  final String mode;
  final String from;
  final String to;
  final String description;
  final String duration;
  final List<String> highlights;

  const TravelRoute({
    required this.mode,
    required this.from,
    required this.to,
    required this.description,
    required this.duration,
    required this.highlights,
  });

  @override
  List<Object?> get props => [
        mode,
        from,
        to,
        description,
        duration,
        highlights,
      ];
}

class Place extends Equatable {
  final String name;
  final String location;
  final double latitude;
  final double longitude;
  final String description;
  final List<String> highlights;

  const Place({
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.highlights,
  });

  @override
  List<Object?> get props => [
        name,
        location,
        latitude,
        longitude,
        description,
        highlights,
      ];
}

String _createTravelRouteCard(TravelRoute travelRoute) {
  return createItemCard('${createInnerCard('Mode', travelRoute.mode)}'
      '${createInnerCard('From', travelRoute.from)}'
      '${createInnerCard('To', travelRoute.to)}'
      '${createInnerCard('Description', travelRoute.description)}'
      '${createInnerCard('Duration', travelRoute.duration)}'
      '${createInnerCard('Highlights', createUnorderedList(travelRoute.highlights))}');
}

String _createPlaceCard(Place place) {
  return createItemCard('${createInnerCard('Name', place.name)}'
      '${createInnerCard('Location', place.location)}'
      '${createInnerCard('Coordinates', '${place.latitude}, ${place.longitude}')}'
      '${createInnerCard('Description', place.description)}'
      '${createInnerCard('Highlights', createUnorderedList(place.highlights))}');
}

extension GenerateItineraryBalloon on Itinerary {
  String generateBalloon() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Itinerary Data</name>
      <Style id="itinerary_style">
        <BalloonStyle>
          <textColor>${AppTheme.color.shade900.toHex()}</textColor>
          <bgColor>${AppTheme.color.shade50.toHex()}</bgColor> <!-- Set the balloon background color here -->
          <text>
            <![CDATA[
            <font size="+2">
              ${createHeading(name)}
              ${createSectionCard("Starting Point", startingPoint)}
              ${createSectionCard("Travel Routes", travelRoute.map((e) => _createTravelRouteCard(e)).join())}
              ${createSectionCard("Places", places.map((e) => _createPlaceCard(e)).join())}
            </font>
            ]]>
          </text>
          <bgColor>${AppTheme.color.shade200.toHex()}</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description><![CDATA[]]></description>
        <styleUrl>#itinerary_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${places.isNotEmpty ? '${places[0].longitude},${places[0].latitude},0' : '0,0,0'}</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }
}
