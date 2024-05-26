import 'package:touristic/data/model/request/tourist_place_request.dart';

import '../../domain/model/activitiy.dart';
import '../../domain/model/budget_plan.dart' as budget;
import '../../domain/model/cuisine.dart';
import '../../domain/model/itinerary.dart' as itinerary;
import '../../domain/model/recommendation.dart';
import '../../domain/model/tourist_place.dart';
import '../model/response/activities_response.dart';
import '../model/response/budget_plan_response.dart';
import '../model/response/itinerary_response.dart';
import '../model/response/local_cuisines_response.dart';
import '../model/response/recommendations_response.dart';
import '../model/response/tourist_places_response.dart';

List<TouristPlace>? responseToTouristPlaces(
  TouristPlacesResponse response,
) {
  return response.touristPlaces
      ?.map((place) => TouristPlace(
            name: place.name ?? "",
            latitude: place.latitude ?? 0,
            longitude: place.longitude ?? 0,
            history: place.history ?? "",
            significance: place.significance ?? "",
            cuisine: place.cuisine ?? "",
            specialty: place.specialty ?? "",
          ))
      .toList();
}

List<TouristPlace> requestToTouristPlaces(
  List<TouristPlaceRequest> response,
) {
  return response
      .map((place) => TouristPlace(
            name: place.name ?? "",
            latitude: place.latitude ?? 0,
            longitude: place.longitude ?? 0,
            history: place.history ?? "",
            significance: place.significance ?? "",
            cuisine: place.cuisine ?? "",
            specialty: place.specialty ?? "",
          ))
      .toList();
}

budget.BudgetPlan responseToBudgetPlan(
  BudgetPlanResponse response,
) {
  return budget.BudgetPlan(
    name: response.name ?? "",
    travelRoute: response.travelRoute
            ?.map((e) => budget.TravelRoute(
                  mode: e.mode ?? "",
                  from: e.from ?? "",
                  to: e.to ?? "",
                  cost: e.cost ?? "",
                  duration: e.duration ?? "",
                ))
            .toList() ??
        [],
    places: response.places
            ?.map((e) => budget.Place(
                  name: e.name ?? "",
                  entranceFee: e.entranceFee ?? "",
                  guidedTourFee: e.guidedTourFee ?? "",
                  averageMealCost: e.averageMealCost ?? "",
                ))
            .toList() ??
        [],
    accommodation: response.accommodation
            ?.map((e) => budget.Accommodation(
                  name: e.name ?? "",
                  description: e.description ?? "",
                  costPerNight: e.costPerNight ?? "",
                  duration: e.description ?? "",
                  totalCost: e.totalCost ?? "",
                ))
            .toList() ??
        [],
    additionalExpenses: response.additionalExpenses
            ?.map((e) => budget.AdditionalExpense(
                  name: e.name ?? "",
                  description: e.description ?? "",
                  estimatedCost: e.estimatedCost ?? "",
                ))
            .toList() ??
        [],
    startingPoint: response.startingPoint ?? "",
    totalCost: response.totalCost ?? "",
  );
}

List<Cuisine>? responseToCuisines(
  LocalCuisinesResponse response,
) {
  return response.cuisines
      ?.map((cuisine) => Cuisine(
            name: cuisine.name ?? "",
            aliases: cuisine.aliases ?? [],
            description: cuisine.description ?? "",
            origin: cuisine.origin ?? "",
            duration: cuisine.duration ?? 0,
            ingredients: cuisine.ingredients ?? [],
            recipe: cuisine.recipe ?? [],
          ))
      .toList();
}

List<Recommendation>? responseToRecommendations(
  RecommendationsResponse response,
) {
  return response.recommendations
      ?.map((recommendation) => Recommendation(
            name: recommendation.name ?? "",
            description: recommendation.description ?? "",
            cost: recommendation.cost ?? 0,
            duration: recommendation.duration ?? 0,
            highlights: recommendation.highlights ?? [],
          ))
      .toList();
}

List<Activity>? responseToActivities(
  ActivitiesResponse response,
) {
  return response.activities
      ?.map((activity) => Activity(
            name: activity.name ?? "",
            description: activity.description ?? "",
            procedure: activity.procedure ?? [],
            precautions: activity.precautions ?? [],
            duration: activity.duration ?? 0,
            cost: activity.cost ?? 0,
          ))
      .toList();
}

itinerary.Itinerary? responseToItinerary(
  ItineraryResponse response,
) {
  return itinerary.Itinerary(
    name: response.name ?? "",
    startingPoint: response.startingPoint ?? "",
    travelRoute: response.travelRoute
            ?.map((e) => itinerary.TravelRoute(
                  mode: e.mode ?? "",
                  from: e.from ?? "",
                  to: e.to ?? "",
                  description: e.description ?? "",
                  duration: e.duration ?? "",
                  highlights: e.highlights ?? [],
                ))
            .toList() ??
        [],
    places: response.places
            ?.map((e) => itinerary.Place(
                  name: e.name ?? "",
                  latitude: e.latitude ?? 0,
                  longitude: e.longitude ?? 0,
                  description: e.description ?? "",
                  highlights: e.highlights ?? [],
                ))
            .toList() ??
        [],
  );
}
