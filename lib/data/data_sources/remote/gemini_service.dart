import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/constants/constants.dart';
import '../../model/response/activities_response.dart';
import '../../model/response/budget_plan_response.dart';
import '../../model/response/itinerary_response.dart';
import '../../model/response/local_cuisines_response.dart';
import '../../model/response/recommendations_response.dart';
import '../../model/response/tourist_places_response.dart';

// part 'gemini_service.g.dart';

@RestApi(baseUrl: geminiBaseUrl)
abstract class GeminiService {
  // factory GeminiService(Dio dio) = _GeminiService;

  @GET("")
  Future<HttpResponse<TouristPlacesResponse>> getTouristPlaces();

  @GET("")
  Future<HttpResponse<ItineraryResponse>> getItinerary();

  @GET("")
  Future<HttpResponse<LocalCuisinesResponse>> getLocalCuisine();

  @GET("")
  Future<HttpResponse<ActivitiesResponse>> getActivities();

  @GET("")
  Future<HttpResponse<BudgetPlanResponse>> getBudgetPlan();

  @GET("")
  Future<HttpResponse<RecommendationsResponse>> getRecommendations();

  @GET("")
  Future<HttpResponse<String>> getChatReply();
}
