import '../../core/resources/data_state.dart';
import '../../core/utils/response_handler.dart';
import '../../domain/model/activitiy.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisine.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendation.dart';
import '../../domain/model/tourist_place.dart';
import '../../domain/repository/gemini_repository.dart';
import '../data_sources/local/tourist_places_dao.dart';
import '../data_sources/remote/gemini_service.dart';
import '../mapper/mappers.dart';
import '../model/request/tourist_place_request.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiService _geminiService;
  final TouristPlacesDao _touristPlaceDao;

  GeminiRepositoryImpl(this._geminiService, this._touristPlaceDao);

  @override
  Future<DataState<BudgetPlan>> getBudgetPlan(
    Map<String, dynamic> params,
  ) {
    return handleApiResponse(
      execute: () {
        return _geminiService.getBudgetPlan();
      },
      mapper: responseToBudgetPlan,
    );
  }

  @override
  Future<DataState<Itinerary>> getItinerary(
    Map<String, dynamic> params,
  ) {
    return handleApiResponse(
      execute: () {
        return _geminiService.getItinerary();
      },
      mapper: responseToItinerary,
    );
  }

  @override
  Future<DataState<List<Cuisine>>> getLocalCuisine(
    Map<String, dynamic> params,
  ) {
    return handleApiResponse(
      execute: () {
        return _geminiService.getLocalCuisine();
      },
      mapper: responseToCuisines,
    );
  }

  @override
  Future<DataState<List<Recommendation>>> getRecommendations(
    Map<String, dynamic> params,
  ) {
    return handleApiResponse(
      execute: () {
        return _geminiService.getRecommendations();
      },
      mapper: responseToRecommendations,
    );
  }

  @override
  Future<DataState<List<Activity>>> getActivities(
    Map<String, dynamic> params,
  ) {
    return handleApiResponse(
      execute: () {
        return _geminiService.getActivities();
      },
      mapper: responseToActivities,
    );
  }

  @override
  Future<DataState<List<TouristPlace>>> getTouristPlaces(
    Map<String, dynamic> params,
  ) {
    return handleApiResponse(
      execute: () {
        return _geminiService.getTouristPlaces();
      },
      mapper: responseToTouristPlaces,
    );
  }

  @override
  Future<DataState<String>> getChatReply(
    Map<String, dynamic> params,
  ) {
    return handleApiResponse(
      execute: () {
        return _geminiService.getChatReply();
      },
      mapper: (p0) {
        return p0;
      },
    );
  }

  @override
  Future<DataState<bool>> addTouristPlace(
    TouristPlace touristPlace,
  ) async {
    try {
      await _touristPlaceDao.insertTouristPlace();
      return const DataSuccess(true);
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<bool>> removeTouristPlace(
    TouristPlace touristPlace,
  ) async {
    try {
      await _touristPlaceDao.deleteTouristPlace();
      return const DataSuccess(true);
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<bool>> clearHistory() async {
    try {
      await _touristPlaceDao.clearTouristPlaces();
      return const DataSuccess(true);
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<List<TouristPlace>>> getHistory() async {
    try {
      final response = await _touristPlaceDao.getTouristPlaces();
      return DataSuccess(
          requestToTouristPlaces(response.cast<TouristPlaceRequest>()));
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }
}
