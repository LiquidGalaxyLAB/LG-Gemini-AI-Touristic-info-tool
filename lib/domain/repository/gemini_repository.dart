import 'package:touristic/domain/model/tourist_place.dart';

import '../../data/model/activities_response.dart';
import '../../data/model/budget_plan_response.dart';
import '../../data/model/itinerary_response.dart';
import '../../data/model/local_cuisines_response.dart';
import '../../data/model/recommendations_response.dart';
import '../../data/model/tourist_places_response.dart';

import '../../core/resources/data_state.dart';

abstract class GeminiRepository {
  Future<DataState<TouristPlacesResponse>> getTouristPlaces();

  Future<DataState<ItineraryResponse>> getItinerary();

  Future<DataState<LocalCuisinesResponse>> getLocalCuisine();

  Future<DataState<ActivitiesResponse>> getActivities();

  Future<DataState<BudgetPlanResponse>> getBudgetPlan();

  Future<DataState<RecommendationsResponse>> getRecommendations();

  Future<DataState<String>> getChatReply();

  Future<DataState<void>> addTouristPlace(TouristPlace touristPlace);

  Future<DataState<void>> removeTouristPlace(TouristPlace touristPlace);

  Future<DataState<List<TouristPlace>>> getHistory();

  Future<DataState<List<void>>> clearHistory();
}
