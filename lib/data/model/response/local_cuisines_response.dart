import 'package:equatable/equatable.dart';

class LocalCuisinesResponse extends Equatable {
  final List<CuisineResponse>? cuisines;

  const LocalCuisinesResponse({
    this.cuisines,
  });

  @override
  List<Object?> get props => [cuisines];

  factory LocalCuisinesResponse.fromJson(Map<String, dynamic> json) {
    return LocalCuisinesResponse(
      cuisines: (json['cuisines'] as List<dynamic>?)
          ?.map((item) => CuisineResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CuisineResponse extends Equatable {
  final String? name;
  final List<String>? aliases;
  final String? description;
  final String? origin;
  final double? duration;
  final List<String>? ingredients;
  final List<String>? recipe;

  const CuisineResponse({
    this.name,
    this.aliases,
    this.description,
    this.origin,
    this.duration,
    this.ingredients,
    this.recipe,
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
  ];

  factory CuisineResponse.fromJson(Map<String, dynamic> json) {
    return CuisineResponse(
      name: json['name'] as String?,
      aliases: (json['aliases'] as List<dynamic>?)?.map((item) => item as String).toList(),
      description: json['description'] as String?,
      origin: json['origin'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      ingredients: (json['ingredients'] as List<dynamic>?)?.map((item) => item as String).toList(),
      recipe: (json['recipe'] as List<dynamic>?)?.map((item) => item as String).toList(),
    );
  }
}