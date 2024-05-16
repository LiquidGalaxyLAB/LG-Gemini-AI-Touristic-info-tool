import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String name;
  final String description;
  final double cost;
  final double duration;
  final List<String> highlights;

  const Recommendation({
    required this.name,
    required this.description,
    required this.cost,
    required this.duration,
    required this.highlights,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        cost,
        duration,
        highlights,
      ];
}
