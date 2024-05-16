import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String name;
  final String description;
  final String procedure;
  final List<String> precautions;
  final double duration;
  final double cost;

  const Activity({
    required this.name,
    required this.description,
    required this.procedure,
    required this.precautions,
    required this.duration,
    required this.cost,
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
}
