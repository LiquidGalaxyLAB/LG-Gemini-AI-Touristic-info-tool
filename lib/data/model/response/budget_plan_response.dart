import 'package:equatable/equatable.dart';

class BudgetPlanResponse extends Equatable {
  final String? name;
  final String? startingPoint;
  final List<TravelRouteResponse>? travelRoute;
  final List<PlaceResponse>? places;
  final List<AccommodationResponse>? accommodation;
  final List<AdditionalExpenseResponse>? additionalExpenses;
  final String? totalCost;
  final double? latitude;
  final double? longitude;

  const BudgetPlanResponse({
    this.name,
    this.startingPoint,
    this.travelRoute,
    this.places,
    this.accommodation,
    this.additionalExpenses,
    this.totalCost,
    this.latitude,
    this.longitude,
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
    latitude,
    longitude,
  ];

  factory BudgetPlanResponse.fromJson(Map<String, dynamic> json) {
    return BudgetPlanResponse(
      name: json['name'] as String?,
      startingPoint: json['startingPoint'] as String?,
      travelRoute: (json['travelRoute'] as List<dynamic>?)
          ?.map((item) => TravelRouteResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
      places: (json['places'] as List<dynamic>?)
          ?.map((item) => PlaceResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
      accommodation: (json['accommodation'] as List<dynamic>?)
          ?.map((item) => AccommodationResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
      additionalExpenses: (json['additionalExpenses'] as List<dynamic>?)
          ?.map((item) => AdditionalExpenseResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalCost: json['totalCost'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }
}

class TravelRouteResponse extends Equatable {
  final String? mode;
  final String? from;
  final String? to;
  final String? cost;
  final String? duration;
  final String? location;
  final double? latitude;
  final double? longitude;

  const TravelRouteResponse({
    this.mode,
    this.from,
    this.to,
    this.cost,
    this.duration,
    this.location,
    this.latitude,
    this.longitude,
  });

  @override
  List<Object?> get props => [
    mode,
    from,
    to,
    cost,
    duration,
    location,
    latitude,
    longitude,
  ];

  factory TravelRouteResponse.fromJson(Map<String, dynamic> json) {
    return TravelRouteResponse(
      mode: json['mode'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
      cost: json['cost'] as String?,
      duration: json['duration'] as String?,
      location: json['location'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }
}

class PlaceResponse extends Equatable {
  final String? name;
  final String? entranceFee;
  final String? guidedTourFee;
  final String? averageMealCost;
  final double? latitude;
  final double? longitude;
  final String? location;

  const PlaceResponse({
    this.name,
    this.entranceFee,
    this.guidedTourFee,
    this.averageMealCost,
    this.latitude,
    this.longitude,
    this.location,
  });

  @override
  List<Object?> get props => [
    name,
    entranceFee,
    guidedTourFee,
    averageMealCost,
    latitude,
    longitude,
    location,
  ];

  factory PlaceResponse.fromJson(Map<String, dynamic> json) {
    return PlaceResponse(
      name: json['name'] as String?,
      entranceFee: json['entranceFee'] as String?,
      guidedTourFee: json['guidedTourFee'] as String?,
      averageMealCost: json['averageMealCost'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
      location: json['location'] as String?,
    );
  }
}

class AccommodationResponse extends Equatable {
  final String? name;
  final String? description;
  final String? costPerNight;
  final String? duration;
  final String? totalCost;

  const AccommodationResponse({
    this.name,
    this.description,
    this.costPerNight,
    this.duration,
    this.totalCost,
  });

  @override
  List<Object?> get props => [
    name,
    description,
    costPerNight,
    duration,
    totalCost,
  ];

  factory AccommodationResponse.fromJson(Map<String, dynamic> json) {
    return AccommodationResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      costPerNight: json['costPerNight'] as String?,
      duration: json['duration'] as String?,
      totalCost: json['totalCost'] as String?,
    );
  }
}

class AdditionalExpenseResponse extends Equatable {
  final String? name;
  final String? description;
  final String? estimatedCost;

  const AdditionalExpenseResponse({
    this.name,
    this.description,
    this.estimatedCost,
  });

  @override
  List<Object?> get props => [
    name,
    description,
    estimatedCost,
  ];

  factory AdditionalExpenseResponse.fromJson(Map<String, dynamic> json) {
    return AdditionalExpenseResponse(
      name: json['name'] as String?,
      description: json['description'] as String?,
      estimatedCost: json['estimatedCost'] as String?,
    );
  }
}
