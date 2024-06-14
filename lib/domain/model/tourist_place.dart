import 'package:equatable/equatable.dart';

class TouristPlace extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String history;
  final String significance;
  final String cuisine;
  final String specialty;
  final String location;

  const TouristPlace({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.history,
    required this.significance,
    required this.cuisine,
    required this.specialty,
    required this.location,
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
}
