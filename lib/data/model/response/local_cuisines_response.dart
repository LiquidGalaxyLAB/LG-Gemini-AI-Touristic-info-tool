import 'package:equatable/equatable.dart';

class LocalCuisinesResponse extends Equatable {
  final List<CuisineResponse>? cuisines;

  const LocalCuisinesResponse({
    this.cuisines,
  });

  @override
  List<Object?> get props => [cuisines];

  factory LocalCuisinesResponse.fromJson(List<dynamic> json) {
    return LocalCuisinesResponse(
      cuisines: json
          .map((item) => CuisineResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CuisineResponse extends Equatable {
  final String? name;
  final List<String>? aliases;
  final String? description;
  final String? origin;
  final String? duration;
  final List<String>? ingredients;
  final List<String>? recipe;
  final double? latitude;
  final double? longitude;
  final String? location;

  const CuisineResponse({
    this.name,
    this.aliases,
    this.description,
    this.origin,
    this.duration,
    this.ingredients,
    this.recipe,
    this.latitude,
    this.longitude,
    this.location,
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
    latitude,
    longitude,
    location,
  ];

  factory CuisineResponse.fromJson(Map<String, dynamic> json) {
    return CuisineResponse(
      name: json['name'] as String?,
      aliases: (json['aliases'] as List<dynamic>?)?.map((item) => item as String).toList(),
      description: json['description'] as String?,
      origin: json['origin'] as String?,
      duration: json['duration'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)?.map((item) => item as String).toList(),
      recipe: (json['recipe'] as List<dynamic>?)?.map((item) => item as String).toList(),
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      location: json['location'] as String?,
    );
  }
}