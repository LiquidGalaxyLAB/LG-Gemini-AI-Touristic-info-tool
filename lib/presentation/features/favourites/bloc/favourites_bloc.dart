import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_state.dart';
import '../../../../domain/model/tourist_place.dart';
import '../../../../domain/usecases/add_favourite_usecase.dart';
import '../../../../domain/usecases/clear_favourite_usecase.dart';
import '../../../../domain/usecases/get_favourites_usecase.dart';
import '../../../../domain/usecases/remove_favourite_usecase.dart';
import 'favourites_event.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, AppState<List<TouristPlace>>> {
  final GetFavouritesUseCase _getFavouritesUseCase;
  final ClearFavouritesUseCase _clearFavouritesUseCase;
  final AddFavouriteUseCase _addFavouriteUseCase;
  final RemoveFavouriteUseCase _removeFavouriteUseCase;

  FavouritesBloc(
    this._getFavouritesUseCase,
    this._clearFavouritesUseCase,
    this._addFavouriteUseCase,
    this._removeFavouriteUseCase,
  ): super(const AppEmpty()) {
    on<GetFavourites>(onGetFavourites);
    on<AddFavourite>(onAddFavourite);
    on<RemoveFavourite>(onRemoveFavourite);
    on<ClearFavourites>(onClearFavourites);
  }

  void onGetFavourites(
    GetFavourites event,
    Emitter<AppState<List<TouristPlace>>> emit,
  ) async {
    emit(const AppLoading());
    final result = await _getFavouritesUseCase();
    if (result.isEmpty) {
      emit(const AppEmpty());
    } else {
      emit(AppSuccess(result));
    }
  }

  void onAddFavourite(
    AddFavourite event,
      Emitter<AppState<List<TouristPlace>>> emit,
  ) async {
    emit(const AppLoading());
    final result = await _addFavouriteUseCase(params: event.touristPlace);
    if (result) {
      final favourites = await _getFavouritesUseCase();
      emit(AppSuccess(favourites));
    } else {
      emit(AppFailure(Exception("onAddFavourite Failed")));
    }
  }

  void onRemoveFavourite(
    RemoveFavourite event,
      Emitter<AppState<List<TouristPlace>>> emit,
  ) async {
    emit(const AppLoading());
    final result = await _removeFavouriteUseCase(params: event.touristPlace);
    if (result) {
      final favourites = await _getFavouritesUseCase();
      if (favourites.isEmpty) {
        emit(const AppEmpty());
      }  else {
        emit(AppSuccess(favourites));
      }
    } else {
      emit(AppFailure(Exception("onRemoveFavourite Failed")));
    }
  }

  void onClearFavourites(
      ClearFavourites event,
      Emitter<AppState<List<TouristPlace>>> emit,
      ) async {
    emit(const AppLoading());
    final result = await _clearFavouritesUseCase();
    if (result) {
      final favourites = await _getFavouritesUseCase();
      emit(AppSuccess(favourites));
    } else {
      emit(AppFailure(Exception("onClearFavourites Failed")));
    }
  }
}