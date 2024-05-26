import 'package:equatable/equatable.dart';

class TouristPlacesResponse extends Equatable {
  final List<TouristPlaceResponse>? touristPlaces;

  const TouristPlacesResponse({
    this.touristPlaces,
  });

  @override
  List<Object?> get props => [touristPlaces];

  factory TouristPlacesResponse.fromJson(Map<String, dynamic> json) {
    return TouristPlacesResponse(
      touristPlaces: (json['touristPlaces'] as List<dynamic>?)
          ?.map((item) => TouristPlaceResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TouristPlaceResponse extends Equatable {
  final String? name;
  final double? latitude;
  final double? longitude;
  final String? history;
  final String? significance;
  final String? cuisine;
  final String? specialty;

  const TouristPlaceResponse({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.history,
    required this.significance,
    required this.cuisine,
    required this.specialty,
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
  ];

  factory TouristPlaceResponse.fromJson(Map<String, dynamic> json) {
    return TouristPlaceResponse(
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      history: json['history'] as String?,
      significance: json['significance'] as String?,
      cuisine: json['cuisine'] as String?,
      specialty: json['specialty'] as String?,
    );
  }
}
