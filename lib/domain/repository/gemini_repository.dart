import '../../core/resources/data_state.dart';
import '../../domain/model/activities.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisines.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendations.dart';
import '../../domain/model/tourist_places.dart';
import '../model/tourist_place.dart';

abstract class GeminiRepository {
  Future<DataState<TouristPlaces>> getTouristPlaces(
    Map<String, dynamic> params,
  );

  Future<DataState<Itinerary>> getItinerary(
    Map<String, dynamic> params,
  );

  Future<DataState<Cuisines>> getLocalCuisine(
    Map<String, dynamic> params,
  );

  Future<DataState<Activities>> getActivities(
    Map<String, dynamic> params,
  );

  Future<DataState<BudgetPlan>> getBudgetPlan(
    Map<String, dynamic> params,
  );

  Future<DataState<Recommendations>> getRecommendations(
    Map<String, dynamic> params,
  );

  Future<DataState<String>> getChatReply(
    Map<String, dynamic> params,
  );

  Future<DataState<bool>> addTouristPlace(
    TouristPlace touristPlace,
  );

  Future<DataState<bool>> removeTouristPlace(
    TouristPlace touristPlace,
  );

  Future<DataState<List<TouristPlace>>> getHistory();

  Future<DataState<bool>> clearHistory();
}
