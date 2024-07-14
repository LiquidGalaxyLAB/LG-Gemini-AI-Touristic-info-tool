import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String name;
  final String description;
  final List<String> procedure;
  final List<String> precautions;
  final String duration;
  final String cost;
  final double latitude;
  final double longitude;

  const Activity({
    required this.name,
    required this.description,
    required this.procedure,
    required this.precautions,
    required this.duration,
    required this.cost,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        procedure,
        precautions,
        duration,
        cost,
        latitude,
        longitude,
      ];
}
