import 'package:equatable/equatable.dart';

class Cuisine extends Equatable {
  final String name;
  final List<String> aliases;
  final String description;
  final String origin;
  final String duration;
  final List<String> ingredients;
  final List<String> recipe;

  const Cuisine({
    required this.name,
    required this.aliases,
    required this.description,
    required this.origin,
    required this.duration,
    required this.ingredients,
    required this.recipe,
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
}
