import 'package:equatable/equatable.dart';

import '../../config/theme/app_theme.dart';
import "../../core/utils/data_utils.dart";
import '../../core/utils/html_utils.dart';

class Activity extends Equatable {
  final String name;
  final String description;
  final List<String> procedure;
  final List<String> precautions;
  final String duration;
  final String cost;
  final double latitude;
  final double longitude;

  const Activity({
    required this.name,
    required this.description,
    required this.procedure,
    required this.precautions,
    required this.duration,
    required this.cost,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        procedure,
        precautions,
        duration,
        cost,
        latitude,
        longitude,
      ];
}

String _createActivityCard(Activity activity) {
  return '${createSectionCard('Name', activity.name, level: 1)}'
      '${createSectionCard('Description', activity.description, level: 1)}'
      '${createSectionCard('Procedure', createUnorderedList(activity.procedure), level: 1)}'
      '${createSectionCard('Precautions', createUnorderedList(activity.precautions), level: 1)}'
      '${createSectionCard('Duration', activity.duration, level: 1)}'
      '${createSectionCard('Cost', activity.cost, level: 1)}';
}

extension GenerateActivityBalloon on Activity {
  String generateBalloon() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Activity Data</name>
      <Style id="activity_style">
        <BalloonStyle>
          <textColor>${AppTheme.color.shade900.toHex()}</textColor>
          <bgColor>${AppTheme.color.shade50.toHex()}</bgColor> <!-- Set the balloon background color here -->
          <text>
            <![CDATA[
            <font size="+2">
              ${createHeading(name)}
              ${createSectionCard("Activity Details", _createActivityCard(this))}
            </font>
            ]]>
          </text>
          <bgColor>${AppTheme.color.shade200.toHex()}</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description><![CDATA[]]></description>
        <styleUrl>#activity_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>$longitude,$latitude,0</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }
}
