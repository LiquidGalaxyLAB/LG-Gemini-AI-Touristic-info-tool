import 'package:touristic/core/resources/data_state.dart';

abstract class GeminiRepository {
  Future<DataState<dynamic>> getTouristPlaces();

  Future<DataState<dynamic>> getItinerary();

  Future<DataState<dynamic>> getLocalCuisine();

  Future<DataState<dynamic>> getActivities();

  Future<DataState<dynamic>> getBudgetPlan();

  Future<DataState<dynamic>> getRecommendations();
}
