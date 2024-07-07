import 'package:get_it/get_it.dart';

import '../../data/data_sources/local/app_database.dart';
import '../../data/data_sources/local/tourist_places_dao.dart';
import '../../data/data_sources/remote/gemini_service.dart';
import '../../data/repository/gemini_repository_impl.dart';
import '../../domain/repository/gemini_repository.dart';
import '../../domain/usecases/add_favourite_usecase.dart';
import '../../domain/usecases/clear_favourite_usecase.dart';
import '../../domain/usecases/get_activities_usecase.dart';
import '../../domain/usecases/get_budget_plan_usecase.dart';
import '../../domain/usecases/get_favourites_usecase.dart';
import '../../domain/usecases/get_itinerary_usecase.dart';
import '../../domain/usecases/get_local_cuisine_usecase.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';
import '../../domain/usecases/get_tourist_places_usecase.dart';
import '../../domain/usecases/remove_favourite_usecase.dart';
import '../core/constants/constants.dart';
import '../domain/usecases/get_chat_reply_usecase.dart';
import '../presentation/features/activity/bloc/activities_bloc.dart';
import '../presentation/features/budget/bloc/budget_plan_bloc.dart';
import '../presentation/features/chat/bloc/chat_bloc.dart';
import '../presentation/features/cuisine/bloc/cuisines_bloc.dart';
import '../presentation/features/favourites/bloc/favourites_bloc.dart';
import '../presentation/features/itinerary/bloc/itinerary_bloc.dart';
import '../presentation/features/recommendation/bloc/recommendations_bloc.dart';
import '../presentation/features/tourist_place/bloc/tourist_places_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network
  sl.registerFactory<GeminiService>(() => GeminiService());

  // Database
  final AppDatabase database = await $FloorAppDatabase.databaseBuilder(appDatabase).build();
  sl.registerFactory<TouristPlacesDao>(() => database.touristPlacesDao);

  // Repositories
  sl.registerFactory<GeminiRepository>(() => GeminiRepositoryImpl(sl(), sl()));

  // UseCases
  sl.registerFactory<GetChatReplyUseCase>(() => GetChatReplyUseCase(sl()));
  sl.registerFactory<GetActivitiesUseCase>(() => GetActivitiesUseCase(sl()));
  sl.registerFactory<GetBudgetPlanUseCase>(() => GetBudgetPlanUseCase(sl()));
  sl.registerFactory<GetItineraryUseCase>(() => GetItineraryUseCase(sl()));
  sl.registerFactory<GetLocalCuisineUseCase>(() => GetLocalCuisineUseCase(sl()));
  sl.registerFactory<GetRecommendationsUseCase>(() => GetRecommendationsUseCase(sl()));
  sl.registerFactory<GetTouristPlacesUseCase>(() => GetTouristPlacesUseCase(sl()));
  sl.registerFactory<AddFavouriteUseCase>(() => AddFavouriteUseCase(sl()));
  sl.registerFactory<RemoveFavouriteUseCase>(() => RemoveFavouriteUseCase(sl()));
  sl.registerFactory<GetFavouritesUseCase>(() => GetFavouritesUseCase(sl()));
  sl.registerFactory<ClearFavouritesUseCase>(() => ClearFavouritesUseCase(sl()));

  // Blocs
  sl.registerFactory<ChatBloc>(() => ChatBloc(sl()));
  sl.registerFactory<FavouritesBloc>(() => FavouritesBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory<ActivitiesBloc>(() => ActivitiesBloc(sl()));
  sl.registerFactory<ItineraryBloc>(() => ItineraryBloc(sl()));
  sl.registerFactory<BudgetPlanBloc>(() => BudgetPlanBloc(sl()));
  sl.registerFactory<CuisinesBloc>(() => CuisinesBloc(sl()));
  sl.registerFactory<RecommendationsBloc>(() => RecommendationsBloc(sl()));
  sl.registerFactory<TouristPlacesBloc>(() => TouristPlacesBloc(sl()));
}
