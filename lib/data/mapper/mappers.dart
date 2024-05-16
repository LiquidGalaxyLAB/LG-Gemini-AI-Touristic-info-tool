import '../model/response/activities_response.dart';
import '../model/response/budget_plan_response.dart';
import '../model/response/itinerary_response.dart';
import '../model/response/local_cuisines_response.dart';
import '../model/response/recommendations_response.dart';
import '../model/response/tourist_places_response.dart';
import '../model/request/tourist_place_request.dart';
import '../../domain/model/activities.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisines.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendations.dart';
import '../../domain/model/tourist_places.dart';
import '../../domain/model/tourist_place.dart';

TouristPlaces responseToTouristPlaces(TouristPlacesResponse response) {
  return TouristPlaces();
}

BudgetPlan responseToBudgetPlan(BudgetPlanResponse response) {
  return BudgetPlan();
}

Cuisines responseToCuisines(LocalCuisinesResponse response) {
  return Cuisines();
}

Recommendations responseToRecommendations(RecommendationsResponse response) {
  return Recommendations();
}

Activities responseToActivities(ActivitiesResponse response) {
  return Activities();
}

Itinerary responseToItinerary(ItineraryResponse response) {
  return Itinerary();
}

List<TouristPlace> responseToTouristPlace(List<TouristPlaceRequest> places) {
  return [];
}