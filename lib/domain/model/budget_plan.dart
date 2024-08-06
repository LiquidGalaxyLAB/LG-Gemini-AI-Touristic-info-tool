import 'package:equatable/equatable.dart';

import '../../config/theme/app_theme.dart';
import "../../core/utils/data_utils.dart";
import '../../core/utils/html_utils.dart';

class BudgetPlan extends Equatable {
  final String name;
  final String startingPoint;
  final List<TravelRoute> travelRoute;
  final List<Place> places;
  final List<Accommodation> accommodation;
  final List<AdditionalExpense> additionalExpenses;
  final String totalCost;
  final double latitude;
  final double longitude;

  const BudgetPlan({
    required this.name,
    required this.startingPoint,
    required this.travelRoute,
    required this.places,
    required this.accommodation,
    required this.additionalExpenses,
    required this.totalCost,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        startingPoint,
        travelRoute,
        places,
        accommodation,
        additionalExpenses,
        totalCost,
        latitude,
        longitude,
      ];
}

class TravelRoute extends Equatable {
  final String mode;
  final String from;
  final String to;
  final String location;
  final double latitude;
  final double longitude;
  final String cost;
  final String duration;

  const TravelRoute({
    required this.mode,
    required this.from,
    required this.to,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.cost,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        mode,
        from,
        to,
        location,
        latitude,
        longitude,
        cost,
        duration,
      ];
}

class Place extends Equatable {
  final String name;
  final String entranceFee;
  final String guidedTourFee;
  final String averageMealCost;
  final String location;
  final double latitude;
  final double longitude;

  const Place({
    required this.name,
    required this.entranceFee,
    required this.guidedTourFee,
    required this.averageMealCost,
    required this.location,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        entranceFee,
        guidedTourFee,
        averageMealCost,
        location,
        latitude,
        longitude,
      ];
}

class Accommodation extends Equatable {
  final String name;
  final String description;
  final String costPerNight;
  final String duration;
  final String totalCost;

  const Accommodation({
    required this.name,
    required this.description,
    required this.costPerNight,
    required this.duration,
    required this.totalCost,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        costPerNight,
        duration,
        totalCost,
      ];
}

class AdditionalExpense extends Equatable {
  final String name;
  final String description;
  final String estimatedCost;

  const AdditionalExpense({
    required this.name,
    required this.description,
    required this.estimatedCost,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        estimatedCost,
      ];
}

String _createPlaceCard(Place place) {
  return createItemCard('${createInnerCard('Name', place.name)}'
      '${createInnerCard('Coordinates', '${place.latitude}, ${place.longitude}')}'
      '${createInnerCard('Average Meal Fee', place.averageMealCost)}'
      '${createInnerCard('Guided Tour Fee', place.guidedTourFee)}'
      '${createInnerCard('Entrance Fee', place.entranceFee)}');
}

String _createTravelRouteCard(TravelRoute travelRoute) {
  return createItemCard(
    'From ${travelRoute.from} to ${travelRoute.to} via ${travelRoute.mode} at USD ${travelRoute.cost}, Duration:${travelRoute.duration}',
    surroundWithP: true,
  );
}

String _createAccommodationCard(Accommodation accommodation) {
  return createItemCard('${createInnerCard('Name', accommodation.name)}'
      '${createInnerCard('Description', accommodation.description)}'
      '${createInnerCard('Cost Per Night', accommodation.costPerNight)}'
      '${createInnerCard('Duration', accommodation.duration)}'
      '${createInnerCard('Total Cost', accommodation.totalCost)}');
}

String _createAdditionalExpenseCard(AdditionalExpense additionalExpense) {
  return createItemCard('${createInnerCard('Name', additionalExpense.name)}'
      '${createInnerCard('Description', additionalExpense.description)}'
      '${createInnerCard('Estimated Cost', additionalExpense.estimatedCost)}');
}

extension GenerateBalloon on BudgetPlan {
  String generateBalloon() {
    return '''<?xml version="1.0" encoding="UTF-8"?>
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document>
      <name>Budget Plan Data</name>
      <Style id="budget_plan_style">
        <BalloonStyle>
          <textColor>${AppTheme.color.shade900.toHex()}</textColor>
          <bgColor>${AppTheme.color.shade50.toHex()}</bgColor> <!-- Set the balloon background color here -->
          <text>
            <![CDATA[
            <font size="+2">
              ${createHeading(name)}
              ${createSectionCard("Starting Point", startingPoint)}
              ${createSectionCard("Places", places.map((e) => _createPlaceCard(e)).join())}
              ${createSectionCard("Travel Route", travelRoute.map((e) => _createTravelRouteCard(e)).join())}
              ${createSectionCard("Accommodation", accommodation.map((e) => _createAccommodationCard(e)).join())}
              ${createSectionCard("Additional Expenses", additionalExpenses.map((e) => _createAdditionalExpenseCard(e)).join())}
              ${createSectionCard("Total Cost", totalCost)}
            </font>
            ]]>
          </text>
          <bgColor>${AppTheme.color.shade200.toHex()}</bgColor>
        </BalloonStyle>
      </Style>
      <Placemark>
        <description><![CDATA[]]></description>
        <styleUrl>#budget_plan_style</styleUrl>
        <gx:balloonVisibility>1</gx:balloonVisibility>
        <Point>
          <coordinates>${places.isNotEmpty ? '${places[0].longitude},${places[0].latitude},0' : '0,0,0'}</coordinates>
        </Point>
      </Placemark>
    </Document>
    </kml>''';
  }
}
