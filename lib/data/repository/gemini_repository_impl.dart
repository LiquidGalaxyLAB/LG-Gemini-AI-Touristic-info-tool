import '../../core/resources/data_state.dart';
import '../../core/resources/response_handler.dart';
import '../../domain/model/activitiy.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/chat_item.dart';
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
    return handleResponse(
      execute: () {
        return _geminiService.getBudgetPlan(params);
      },
      mapper: responseToBudgetPlan,
    );
  }

  @override
  Future<DataState<Itinerary>> getItinerary(
    Map<String, dynamic> params,
  ) {
    return handleResponse(
      execute: () {
        return _geminiService.getItinerary(params);
      },
      mapper: responseToItinerary,
    );
  }

  @override
  Future<DataState<List<Cuisine>>> getLocalCuisine(
    Map<String, dynamic> params,
  ) {
    return handleResponse(
      execute: () {
        return _geminiService.getLocalCuisine(params);
      },
      mapper: responseToCuisines,
    );
  }

  @override
  Future<DataState<List<Recommendation>>> getRecommendations(
    Map<String, dynamic> params,
  ) {
    return handleResponse(
      execute: () {
        return _geminiService.getRecommendations(params);
      },
      mapper: responseToRecommendations,
    );
  }

  @override
  Future<DataState<List<Activity>>> getActivities(
    Map<String, dynamic> params,
  ) {
    return handleResponse(
      execute: () {
        return _geminiService.getActivities(params);
      },
      mapper: responseToActivities,
    );
  }

  @override
  Future<DataState<List<TouristPlace>>> getTouristPlaces(
    Map<String, dynamic> params,
  ) {
    return handleResponse(
      execute: () {
        return _geminiService.getTouristPlaces(params);
      },
      mapper: responseToTouristPlaces,
    );
  }

  @override
  Future<DataState<String>> getChatReply(
    List<ChatItem> params,
  ) {
    return handleResponse(
      execute: () {
        return _geminiService.getChatReply(params);
      },
      mapper: (p0) {
        return p0;
      },
    );
  }

  @override
  Future<bool> addFavourite(
    TouristPlace touristPlace,
  ) async {
    try {
      await _touristPlaceDao.insertFavourite(
        touristPlaceToRequest(touristPlace),
      );
      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> removeFavourite(
    TouristPlace touristPlace,
  ) async {
    try {
      await _touristPlaceDao.deleteFavourite(
        touristPlaceToRequest(touristPlace),
      );
      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<bool> clearFavourites() async {
    try {
      await _touristPlaceDao.clearFavourites();
      return true;
    } on Exception {
      return false;
    }
  }

  @override
  Future<List<TouristPlace>> getFavourites() async {
    try {
      final response = await _touristPlaceDao.getFavourites();
      return requestToTouristPlaces(response.cast<TouristPlaceRequest>());
    } on Exception {
      return [];
    }
  }
}
