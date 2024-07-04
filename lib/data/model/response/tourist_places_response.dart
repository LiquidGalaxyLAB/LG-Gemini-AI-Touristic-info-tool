import 'package:equatable/equatable.dart';

class TouristPlacesResponse extends Equatable {
  final List<TouristPlaceResponse>? touristPlaces;

  const TouristPlacesResponse({
    this.touristPlaces,
  });

  @override
  List<Object?> get props => [touristPlaces];

  factory TouristPlacesResponse.fromJson(List<dynamic> json) {
    return TouristPlacesResponse(
      touristPlaces: json
          .map((item) => TouristPlaceResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TouristPlaceResponse extends Equatable {
  final String? name;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? history;
  final String? significance;
  final String? cuisine;
  final String? specialty;

  const TouristPlaceResponse({
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.history,
    this.significance,
    this.cuisine,
    this.specialty,
  });

  @override
  List<Object?> get props => [
    name,
    latitude,
    longitude,
    history,
    significance,
    cuisine,
    specialty,
    location
  ];

  factory TouristPlaceResponse.fromJson(Map<String, dynamic> json) {
    return TouristPlaceResponse(
      name: json['name'] as String?,
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      history: json['history'] as String?,
      significance: json['significance'] as String?,
      cuisine: json['cuisine'] as String?,
      specialty: json['specialty'] as String?,
    );
  }
}
