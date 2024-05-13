import '../../core/resources/data_state.dart';
import '../../domain/repository/gemini_repository.dart';
import '../data_sources/local/tourist_places_dao.dart';
import '../data_sources/remote/gemini_service.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiService _geminiService;
  final TouristPlacesDao _touristPlaceDao;
  GeminiRepositoryImpl(this._geminiService, this._touristPlaceDao);

  @override
  Future<DataState> getBudgetPlan() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> getItinerary() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> getLocalCuisine() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> getRecommendations() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> getActivities() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> getTouristPlaces() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> getChatReply() {
    throw UnimplementedError();
  }

}