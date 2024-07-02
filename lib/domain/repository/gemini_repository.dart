import '../../core/resources/data_state.dart';
import '../../domain/model/activitiy.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisine.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendation.dart';
import '../../domain/model/tourist_place.dart';
import '../model/chat_item.dart';

abstract class GeminiRepository {
  Future<DataState<List<TouristPlace>>> getTouristPlaces(
    Map<String, dynamic> params,
  );

  Future<DataState<Itinerary>> getItinerary(
    Map<String, dynamic> params,
  );

  Future<DataState<List<Cuisine>>> getLocalCuisine(
    Map<String, dynamic> params,
  );

  Future<DataState<List<Activity>>> getActivities(
    Map<String, dynamic> params,
  );

  Future<DataState<BudgetPlan>> getBudgetPlan(
    Map<String, dynamic> params,
  );

  Future<DataState<List<Recommendation>>> getRecommendations(
    Map<String, dynamic> params,
  );

  Future<DataState<String>> getChatReply(
      List<ChatItem> params,
  );

  Future<bool> addFavourite(
    TouristPlace touristPlace,
  );

  Future<bool> removeFavourite(
    TouristPlace touristPlace,
  );

  Future<List<TouristPlace>> getFavourites();

  Future<bool> clearFavourites();
}
