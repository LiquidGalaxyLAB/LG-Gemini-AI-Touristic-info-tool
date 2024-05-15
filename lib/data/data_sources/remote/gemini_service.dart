import 'package:retrofit/retrofit.dart';
import 'package:touristic/data/model/activities_response.dart';
import 'package:touristic/data/model/budget_plan_response.dart';
import 'package:touristic/data/model/itinerary_response.dart';
import 'package:touristic/data/model/local_cuisines_response.dart';
import 'package:touristic/data/model/recommendations_response.dart';
import 'package:touristic/data/model/tourist_places_response.dart';

import '../../../core/constants/constants.dart';

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
