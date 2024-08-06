import 'package:equatable/equatable.dart';

import '../../config/theme/app_theme.dart';
import "../../core/utils/data_utils.dart";
import '../../core/utils/html_utils.dart';

class Cuisine extends Equatable {
  final String name;
  final List<String> aliases;
  final String description;
  final String origin;
  final String duration;
  final List<String> ingredients;
  final List<String> recipe;
  final String location;
  final double latitude;
  final double longitude;

  const Cuisine({
    required this.name,
    required this.aliases,
    required this.description,
    required this.origin,
    required this.duration,
    required this.ingredients,
    required this.recipe,
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        aliases,
        description,
        origin,
        duration,
        ingredients,
        recipe,
        location,
        latitude,
        longitude,
      ];
}

String _createCuisineCard(Cuisine cuisine) {
  return '${createSectionCard('Name', cuisine.name, level: 1)}'
      '${createSectionCard('Aliases', createUnorderedList(cuisine.aliases), level: 1)}'
      '${createSectionCard('Description', cuisine.description, level: 1)}'
      '${createSectionCard('Origin', cuisine.origin, level: 1)}'
      '${createSectionCard('Duration', cuisine.duration, level: 1)}'
      '${createSectionCard('Ingredients', createUnorderedList(cuisine.ingredients), level: 1)}'
      '${createSectionCard('Recipe', createUnorderedList(cuisine.recipe), level: 1)}';
}

extension GenerateCuisineBalloon on Cuisine {
  String generateBalloon() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Cuisine Data</name>
      <Style id="cuisine_style">
        <BalloonStyle>
          <textColor>${AppTheme.color.shade900.toHex()}</textColor>
          <bgColor>${AppTheme.color.shade50.toHex()}</bgColor> <!-- Set the balloon background color here -->
          <text>
            <![CDATA[
            <font size="+2">
              ${createHeading(name)}
              ${createSectionCard("Cuisine Details", _createCuisineCard(this))}
            </font>
            ]]>
          </text>
          <bgColor>${AppTheme.color.shade200.toHex()}</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description><![CDATA[]]></description>
        <styleUrl>#cuisine_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>$longitude,$latitude,0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }
}
