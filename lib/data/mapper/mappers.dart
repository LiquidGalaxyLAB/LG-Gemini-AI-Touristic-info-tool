import 'package:touristic/data/model/activities_response.dart';
import 'package:touristic/data/model/budget_plan_response.dart';
import 'package:touristic/data/model/itinerary_response.dart';
import 'package:touristic/data/model/local_cuisines_response.dart';
import 'package:touristic/data/model/recommendations_response.dart';
import 'package:touristic/domain/model/activities.dart';
import 'package:touristic/domain/model/budget_plan.dart';
import 'package:touristic/domain/model/cuisines.dart';
import 'package:touristic/domain/model/itinerary.dart';
import 'package:touristic/domain/model/recommendations.dart';

import '../../domain/model/tourist_places.dart';
import '../model/tourist_places_response.dart';

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
