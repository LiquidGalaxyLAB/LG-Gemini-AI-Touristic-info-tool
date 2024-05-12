import 'package:retrofit/http.dart';
import 'package:touristic/core/constants/constants.dart';
import 'package:touristic/core/resources/data_state.dart';

// part 'gemini_service.g.dart';

@RestApi(baseUrl: geminiBaseUrl)
abstract class GeminiService {

  @GET("")
  Future<DataState<dynamic>> getTouristPlaces();

  @GET("")
  Future<DataState<dynamic>> getItinerary();

  @GET("")
  Future<DataState<dynamic>> getLocalCuisine();

  @GET("")
  Future<DataState<dynamic>> getActivities();

  @GET("")
  Future<DataState<dynamic>> getBudgetPlan();

  @GET("")
  Future<DataState<dynamic>> getRecommendations();
}