import '../../core/resources/data_state.dart';
import '../../domain/model/activities.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisines.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendations.dart';
import '../../domain/model/tourist_place.dart';
import '../../domain/model/tourist_places.dart';
import '../../domain/repository/gemini_repository.dart';
import '../data_sources/local/tourist_places_dao.dart';
import '../data_sources/remote/gemini_service.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiService _geminiService;
  final TouristPlacesDao _touristPlaceDao;
  GeminiRepositoryImpl(this._geminiService, this._touristPlaceDao);

  @override
  Future<DataState<BudgetPlan>> getBudgetPlan() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<Itinerary>> getItinerary() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<Cuisines>> getLocalCuisine() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<Recommendations>> getRecommendations() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<Activities>> getActivities() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<TouristPlaces>> getTouristPlaces() {
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