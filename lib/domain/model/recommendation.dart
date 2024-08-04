import 'package:equatable/equatable.dart';

import '../../config/theme/app_theme.dart';
import "../../core/utils/data_utils.dart";
import '../../core/utils/html_utils.dart';

class Recommendation extends Equatable {
  final String name;
  final String description;
  final String cost;
  final String duration;
  final List<String> highlights;
  final double latitude;
  final double longitude;

  const Recommendation({
    required this.name,
    required this.description,
    required this.cost,
    required this.duration,
    required this.highlights,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        cost,
        duration,
        highlights,
        latitude,
        longitude,
      ];
}

String _createRecommendationCard(Recommendation recommendation) {
  return '${createSectionCard('Name', recommendation.name, level: 1)}'
      '${createSectionCard('Description', recommendation.description, level: 1)}'
      '${createSectionCard('Cost', recommendation.cost, level: 1)}'
      '${createSectionCard('Duration', recommendation.duration, level: 1)}'
      '${createSectionCard('Highlights', createUnorderedList(recommendation.highlights), level: 1)}';
}

extension GenerateRecommendationBalloon on Recommendation {
  String generateBalloon() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Recommendation Data</name>
      <Style id="recommendation_style">
        <BalloonStyle>
          <textColor>${AppTheme.color.shade900.toHex()}</textColor>
          <bgColor>${AppTheme.color.shade50.toHex()}</bgColor> <!-- Set the balloon background color here -->
          <text>
            <![CDATA[
            <font size="+2">
              ${createHeading(name)}
              ${createSectionCard("Recommendation Details", _createRecommendationCard(this))}
            </font>
            ]]>
          </text>
          <bgColor>${AppTheme.color.shade200.toHex()}</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description><![CDATA[]]></description>
        <styleUrl>#recommendation_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>$longitude,$latitude,0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }
}
