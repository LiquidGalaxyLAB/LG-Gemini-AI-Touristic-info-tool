import 'package:touristic/core/resources/data_state.dart';
import 'package:touristic/features/home/data/data_sources/remote/gemini_service.dart';
import 'package:touristic/features/home/domain/repository/gemini_repository.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiService _geminiService;
  GeminiRepositoryImpl(this._geminiService);

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

}