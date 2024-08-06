import 'package:equatable/equatable.dart';

class RecommendationsResponse extends Equatable {
  final List<RecommendationResponse>? recommendations;

  const RecommendationsResponse({
    this.recommendations,
  });

  @override
  List<Object?> get props => [recommendations];

  factory RecommendationsResponse.fromJson(List<dynamic> json) {
    return RecommendationsResponse(
      recommendations: json
          .map((item) => RecommendationResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RecommendationResponse extends Equatable {
  final String? name;
  final String? description;
  final String? cost;
  final String? duration;
  final List<String>? highlights;
  final double? latitude;
  final double? longitude;
  final String? location;

  const RecommendationResponse({
    this.name,
    this.description,
    this.cost,
    this.duration,
    this.highlights,
    this.latitude,
    this.longitude,
    this.location,
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
    location,
  ];

  factory RecommendationResponse.fromJson(Map<String, dynamic> json) {
    return RecommendationResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      cost: json['cost'] as String?,
      duration: json['duration'] as String?,
      highlights: (json['highlights'] as List<dynamic>?)?.map((item) => item as String).toList(),
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      location: json['location'] as String?,
    );
  }
}