import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:touristic/data/model/activities_response.dart';
import 'package:touristic/data/model/budget_plan_response.dart';
import 'package:touristic/data/model/itinerary_response.dart';
import 'package:touristic/data/model/local_cuisines_response.dart';
import 'package:touristic/data/model/recommendations_response.dart';
import 'package:touristic/data/model/tourist_places_response.dart';

import '../../../core/constants/constants.dart';
import '../../../core/resources/data_state.dart';

// part 'gemini_service.g.dart';

@RestApi(baseUrl: geminiBaseUrl)
abstract class GeminiService {

  // factory GeminiService(Dio dio) = _GeminiService;

  @GET("")
  Future<DataState<TouristPlacesResponse>> getTouristPlaces();

  @GET("")
  Future<DataState<ItineraryResponse>> getItinerary();

  @GET("")
  Future<DataState<LocalCuisinesResponse>> getLocalCuisine();

  @GET("")
  Future<DataState<ActivitiesResponse>> getActivities();

  @GET("")
  Future<DataState<BudgetPlanResponse>> getBudgetPlan();

  @GET("")
  Future<DataState<RecommendationsResponse>> getRecommendations();

  @GET("")
  Future<DataState<String>> getChatReply();
}