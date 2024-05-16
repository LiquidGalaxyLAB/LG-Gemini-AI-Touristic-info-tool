import 'package:touristic/data/model/request/tourist_place_request.dart';

import '../model/response/activities_response.dart';
import '../model/response/budget_plan_response.dart';
import '../model/response/itinerary_response.dart';
import '../model/response/local_cuisines_response.dart';
import '../model/response/recommendations_response.dart';
import '../model/response/tourist_places_response.dart';
import '../../domain/model/activitiy.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisine.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendation.dart';
import '../../domain/model/tourist_place.dart';

List<TouristPlace> responseToTouristPlaces(TouristPlacesResponse response) {
  return [];
}

List<TouristPlace> requestToTouristPlaces(List<TouristPlaceRequest> response) {
  return [];
}


BudgetPlan responseToBudgetPlan(BudgetPlanResponse response) {
  return const BudgetPlan(name: '', travelRoute: [], places: [], accommodation: [], additionalExpenses: [], startingPoint: '', totalCost: '');
}

List<Cuisine> responseToCuisines(LocalCuisinesResponse response) {
  return [];
}

List<Recommendation> responseToRecommendations(RecommendationsResponse response) {
  return [];
}

List<Activity> responseToActivities(ActivitiesResponse response) {
  return [];
}

Itinerary responseToItinerary(ItineraryResponse response) {
  return const Itinerary(name: '', startingPoint: '', travelRoute: [], places: []);
}