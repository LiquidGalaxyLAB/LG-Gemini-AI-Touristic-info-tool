import 'package:equatable/equatable.dart';

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
  final double latitude;
  final double longitude;
  final String description;
  final List<String> highlights;

  const Place({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.highlights,
  });

  @override
  List<Object?> get props => [
        name,
        latitude,
        longitude,
        description,
        highlights,
      ];
}
