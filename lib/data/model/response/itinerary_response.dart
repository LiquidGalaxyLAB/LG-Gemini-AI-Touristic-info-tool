import 'package:equatable/equatable.dart';

class ItineraryResponse extends Equatable {
  final String? name;
  final String? startingPoint;
  final List<TravelRouteResponse>? travelRoute;
  final List<PlaceResponse>? places;

  const ItineraryResponse({
    this.name,
    this.startingPoint,
    this.travelRoute,
    this.places,
  });

  @override
  List<Object?> get props => [
        name,
        startingPoint,
        travelRoute,
        places,
      ];

  factory ItineraryResponse.fromJson(Map<String, dynamic> json) {
    return ItineraryResponse(
      name: json['name'] as String?,
      startingPoint: json['startingPoint'] as String?,
      travelRoute: (json['travelRoute'] as List<dynamic>?)
          ?.map((item) => TravelRouteResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
      places: (json['places'] as List<dynamic>?)
          ?.map((item) => PlaceResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TravelRouteResponse extends Equatable {
  final String? mode;
  final String? from;
  final String? to;
  final String? description;
  final String? duration;
  final List<String>? highlights;

  const TravelRouteResponse({
    this.mode,
    this.from,
    this.to,
    this.description,
    this.duration,
    this.highlights,
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

  factory TravelRouteResponse.fromJson(Map<String, dynamic> json) {
    return TravelRouteResponse(
      mode: json['mode'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      description: json['description'] as String?,
      duration: json['duration'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }
}

class PlaceResponse extends Equatable {
  final String? name;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? description;
  final List<String>? highlights;

  const PlaceResponse({
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.description,
    this.highlights,
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

  factory PlaceResponse.fromJson(Map<String, dynamic> json) {
    return PlaceResponse(
      name: json['name'] as String?,
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      description: json['description'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }
}
