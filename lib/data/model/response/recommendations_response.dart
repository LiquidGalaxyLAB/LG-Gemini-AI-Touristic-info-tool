import 'package:equatable/equatable.dart';

class RecommendationsResponse extends Equatable {
  final List<RecommendationResponse>? recommendations;

  const RecommendationsResponse({
    this.recommendations,
  });

  @override
  List<Object?> get props => [recommendations];

  factory RecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return RecommendationsResponse(
      recommendations: (json['recommendations'] as List<dynamic>?)
          ?.map((item) => RecommendationResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RecommendationResponse extends Equatable {
  final String? name;
  final String? description;
  final double? cost;
  final double? duration;
  final List<String>? highlights;

  const RecommendationResponse({
    this.name,
    this.description,
    this.cost,
    this.duration,
    this.highlights,
  });

  @override
  List<Object?> get props => [
    name,
    description,
    cost,
    duration,
    highlights,
  ];

  factory RecommendationResponse.fromJson(Map<String, dynamic> json) {
    return RecommendationResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      highlights: (json['highlights'] as List<dynamic>?)?.map((item) => item as String).toList(),
    );
  }
}