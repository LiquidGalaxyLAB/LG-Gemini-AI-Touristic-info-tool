import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'data/data_sources/local/tourist_places_dao.dart';
import 'data/data_sources/remote/gemini_service.dart';
import 'data/repository/gemini_repository_impl.dart';
import 'domain/repository/gemini_repository.dart';
import 'domain/usecases/add_tourist_place_usecase.dart';
import 'domain/usecases/clear_history_usecase.dart';
import 'domain/usecases/get_activities_usecase.dart';
import 'domain/usecases/get_budget_plan_usecase.dart';
import 'domain/usecases/get_history_usecase.dart';
import 'domain/usecases/get_itinerary_usecase.dart';
import 'domain/usecases/get_local_cuisine_usecase.dart';
import 'domain/usecases/get_recommendations_usecase.dart';
import 'domain/usecases/get_tourist_places_usecase.dart';
import 'domain/usecases/remove_tourist_place_usecase.dart';

import 'data/data_sources/local/app_database.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network
  sl.registerSingleton<Dio>(Dio());
  // sl.registerSingleton<GeminiService>(GeminiService(sl()));

  // Database
  // final AppDatabase database = await $FloorAppDatabase.databaseBuilder(appDatabase).build();
  // sl.registerSingleton<TouristPlacesDao>(database.touristPlacesDao);

  // Repositories
  sl.registerSingleton<GeminiRepository>(GeminiRepositoryImpl(sl(), sl()));

  // UseCases
  sl.registerSingleton(GetActivitiesUseCase(sl()));
  sl.registerSingleton(GetBudgetPlanUseCase(sl()));
  sl.registerSingleton(GetItineraryUseCase(sl()));
  sl.registerSingleton(GetLocalCuisineUseCase(sl()));
  sl.registerSingleton(GetRecommendationsUseCase(sl()));
  sl.registerSingleton(GetTouristPlacesUseCase(sl()));
  sl.registerSingleton(AddTouristPlaceUseCase(sl()));
  sl.registerSingleton(RemoveTouristPlaceUseCase(sl()));
  sl.registerSingleton(GetHistoryPlaceUseCase(sl()));
  sl.registerSingleton(ClearHistoryUseCase(sl()));

  // Blocs
}
