import 'package:touristic/data/model/activities_response.dart';
import 'package:touristic/data/model/budget_plan_response.dart';
import 'package:touristic/data/model/local_cuisines_response.dart';
import 'package:touristic/data/model/itinerary_response.dart';
import 'package:touristic/data/model/tourist_places_response.dart';
import 'package:touristic/domain/model/tourist_place.dart';

import '../../core/resources/data_state.dart';
import '../../domain/repository/gemini_repository.dart';
import '../data_sources/local/tourist_places_dao.dart';
import '../data_sources/remote/gemini_service.dart';
import '../model/recommendations_response.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiService _geminiService;
  final TouristPlacesDao _touristPlaceDao;
  GeminiRepositoryImpl(this._geminiService, this._touristPlaceDao);

  @override
  Future<DataState<BudgetPlanResponse>> getBudgetPlan() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<ItineraryResponse>> getItinerary() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<LocalCuisinesResponse>> getLocalCuisine() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<RecommendationsResponse>> getRecommendations() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<ActivitiesResponse>> getActivities() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<TouristPlacesResponse>> getTouristPlaces() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<String>> getChatReply() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> addTouristPlace(TouristPlace touristPlace) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<void>>> clearHistory() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<TouristPlace>>> getHistory() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<void>> removeTouristPlace(TouristPlace touristPlace) {
    throw UnimplementedError();
  }

}