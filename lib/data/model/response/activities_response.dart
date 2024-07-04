import 'package:equatable/equatable.dart';

class ActivitiesResponse extends Equatable {
  final List<ActivityResponse>? activities;

  const ActivitiesResponse({
    this.activities,
  });

  @override
  List<Object?> get props => [activities];

  factory ActivitiesResponse.fromJson(List<dynamic> json) {
    return ActivitiesResponse(
      activities: json.map((item) => ActivityResponse.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

class ActivityResponse extends Equatable {
  final String? name;
  final String? description;
  final List<String>? procedure;
  final List<String>? precautions;
  final String? duration;
  final String? cost;

  const ActivityResponse({
    this.name,
    this.description,
    this.procedure,
    this.precautions,
    this.duration,
    this.cost,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        procedure,
        precautions,
        duration,
        cost,
      ];

  factory ActivityResponse.fromJson(Map<String, dynamic> json) {
    return ActivityResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      procedure: (json['procedure'] as List<dynamic>?)?.map((item) => item as String).toList(),
      precautions: (json['precautions'] as List<dynamic>?)?.map((item) => item as String).toList(),
      duration: json['duration'] as String?,
      cost: json['cost'] as String?,
    );
  }
}
