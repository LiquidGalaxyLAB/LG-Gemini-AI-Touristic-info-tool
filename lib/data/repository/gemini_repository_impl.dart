import 'package:touristic/core/utils/response_handler.dart';
import 'package:touristic/data/mapper/mappers.dart';

import '../../core/resources/data_state.dart';
import '../../domain/model/activities.dart';
import '../../domain/model/budget_plan.dart';
import '../../domain/model/cuisines.dart';
import '../../domain/model/itinerary.dart';
import '../../domain/model/recommendations.dart';
import '../../domain/model/tourist_place.dart' as domain;
import '../../data/model/tourist_place.dart' as data;
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
    return handleApiResponse(
      execute: () {
        return _geminiService.getBudgetPlan();
      },
      mapper: responseToBudgetPlan,
    );
  }

  @override
  Future<DataState<Itinerary>> getItinerary() {
    return handleApiResponse(
      execute: () {
        return _geminiService.getItinerary();
      },
      mapper: responseToItinerary,
    );
  }

  @override
  Future<DataState<Cuisines>> getLocalCuisine() {
    return handleApiResponse(
      execute: () {
        return _geminiService.getLocalCuisine();
      },
      mapper: responseToCuisines,
    );
  }

  @override
  Future<DataState<Recommendations>> getRecommendations() {
    return handleApiResponse(
      execute: () {
        return _geminiService.getRecommendations();
      },
      mapper: responseToRecommendations,
    );
  }

  @override
  Future<DataState<Activities>> getActivities() {
    return handleApiResponse(
      execute: () {
        return _geminiService.getActivities();
      },
      mapper: responseToActivities,
    );
  }

  @override
  Future<DataState<TouristPlaces>> getTouristPlaces() {
    return handleApiResponse(
      execute: () {
        return _geminiService.getTouristPlaces();
      },
      mapper: responseToTouristPlaces,
    );
  }

  @override
  Future<DataState<String>> getChatReply() {
    return handleApiResponse(
      execute: () {
        return _geminiService.getChatReply();
      },
      mapper: (p0) { return p0; },
    );
  }

  @override
  Future<DataState<void>> addTouristPlace(domain.TouristPlace touristPlace) async {
    try {
      await _touristPlaceDao.insertTouristPlace();
      return const DataSuccess(null);
    } on Exception catch(e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<void>> clearHistory() async {
    try {
      await _touristPlaceDao.clearTouristPlaces();
      return const DataSuccess(null);
    } on Exception catch(e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<List<domain.TouristPlace>>> getHistory() async {
    try {
      final response = await _touristPlaceDao.getTouristPlaces();
      return DataSuccess(responseToTouristPlace(response.cast<data.TouristPlace>()));
    } on Exception catch(e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<void>> removeTouristPlace(domain.TouristPlace touristPlace) async {
    try {
      await _touristPlaceDao.deleteTouristPlace();
      return const DataSuccess(null);
    } on Exception catch(e) {
      return DataFailure(e);
    }
  }
}
