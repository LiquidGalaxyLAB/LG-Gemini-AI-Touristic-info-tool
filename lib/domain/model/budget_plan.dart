import 'package:equatable/equatable.dart';

class BudgetPlan extends Equatable {
  final String name;
  final String startingPoint;
  final List<TravelRoute> travelRoute;
  final List<Place> places;
  final List<Accommodation> accommodation;
  final List<AdditionalExpense> additionalExpenses;
  final String totalCost;

  const BudgetPlan({
    required this.name,
    required this.startingPoint,
    required this.travelRoute,
    required this.places,
    required this.accommodation,
    required this.additionalExpenses,
    required this.totalCost,
  });

  @override
  List<Object?> get props => [
        name,
        startingPoint,
        travelRoute,
        places,
        accommodation,
        additionalExpenses,
        totalCost,
      ];
}

class TravelRoute extends Equatable {
  final String mode;
  final String from;
  final String to;
  final String cost;
  final String duration;

  const TravelRoute({
    required this.mode,
    required this.from,
    required this.to,
    required this.cost,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        mode,
        from,
        to,
        cost,
        duration,
      ];
}

class Place extends Equatable {
  final String name;
  final String entranceFee;
  final String guidedTourFee;
  final String averageMealCost;
  final double latitude;
  final double longitude;

  const Place({
    required this.name,
    required this.entranceFee,
    required this.guidedTourFee,
    required this.averageMealCost,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        entranceFee,
        guidedTourFee,
        averageMealCost,
        latitude,
        longitude,
      ];
}

class Accommodation extends Equatable {
  final String name;
  final String description;
  final String costPerNight;
  final String duration;
  final String totalCost;

  const Accommodation({
    required this.name,
    required this.description,
    required this.costPerNight,
    required this.duration,
    required this.totalCost,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        costPerNight,
        duration,
        totalCost,
      ];
}

class AdditionalExpense extends Equatable {
  final String name;
  final String description;
  final String estimatedCost;

  const AdditionalExpense({
    required this.name,
    required this.description,
    required this.estimatedCost,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        estimatedCost,
      ];
}
