import 'package:touristic/domain/model/tourist_place.dart';

import '../../domain/model/activities.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/cuisines.dart';
import '../../domain/model/recommendations.dart';
import '../../domain/model/tourist_places.dart';

import '../../core/resources/data_state.dart';

abstract class GeminiRepository {
  Future<DataState<TouristPlaces>> getTouristPlaces();

  Future<DataState<Itinerary>> getItinerary();

  Future<DataState<Cuisines>> getLocalCuisine();

  Future<DataState<Activities>> getActivities();

  Future<DataState<BudgetPlan>> getBudgetPlan();

  Future<DataState<Recommendations>> getRecommendations();

  Future<DataState<String>> getChatReply();

  Future<DataState<void>> addTouristPlace(TouristPlace touristPlace);

  Future<DataState<void>> removeTouristPlace(TouristPlace touristPlace);

  Future<DataState<List<TouristPlace>>> getHistory();

  Future<DataState<void>> clearHistory();
}
