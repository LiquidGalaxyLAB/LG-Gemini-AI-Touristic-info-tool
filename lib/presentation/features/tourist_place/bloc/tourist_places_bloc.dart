import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../domain/model/tourist_place.dart';
import '../../../../domain/usecases/get_tourist_places_usecase.dart';
import 'tourist_places_event.dart';

class TouristPlacesBloc
    extends Bloc<TouristPlacesEvent, AppState<List<TouristPlace>>> {
  final GetTouristPlacesUseCase _getTouristPlacesUseCase;

  TouristPlacesBloc(
    this._getTouristPlacesUseCase,
  ) : super(const AppEmpty()) {
    on<GetTouristPlaces>(onGetTouristPlaces);
  }

  void onGetTouristPlaces(
    GetTouristPlaces event,
    Emitter<AppState<List<TouristPlace>>> emit,
  ) async {
    emit(const AppLoading());
    final dataState = await _getTouristPlacesUseCase(params: event.params);
    if (dataState is DataSuccess) {
      emit(AppSuccess(dataState.data!));
    } else {
      emit(AppFailure(dataState.exception!));
    }
  }
}
