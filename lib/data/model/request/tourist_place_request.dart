import 'package:floor/floor.dart';

import 'package:equatable/equatable.dart';

@Entity(tableName: 'tourist_places', primaryKeys: ['latitude', 'longitude'])
class TouristPlaceRequest extends Equatable {
  final String? name;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? history;
  final String? significance;
  final String? cuisine;
  final String? specialty;

  const TouristPlaceRequest({
    this.location,
    this.name,
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
    location,
    significance,
    cuisine,
    specialty,
  ];

  factory TouristPlaceRequest.fromJson(Map<String, dynamic> json) {
    return TouristPlaceRequest(
      name: json['name'] as String?,
      location: json['location'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      history: json['history'] as String?,
      significance: json['significance'] as String?,
      cuisine: json['cuisine'] as String?,
      specialty: json['specialty'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'history': history,
      'significance': significance,
      'cuisine': cuisine,
      'specialty': specialty,
    };
  }
}