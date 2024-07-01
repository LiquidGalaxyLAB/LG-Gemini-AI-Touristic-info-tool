import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../domain/model/itinerary.dart';
import '../../../../domain/usecases/get_itinerary_usecase.dart';
import 'itinerary_event.dart';

class ItineraryBloc extends Bloc<ItineraryEvent, AppState<Itinerary>> {
  final GetItineraryUseCase _getItineraryUseCase;

  ItineraryBloc(
    this._getItineraryUseCase,
  ) : super(const AppEmpty()) {
    on<GetItinerary>(onGetItinerary);
  }

  void onGetItinerary(
    GetItinerary event,
    Emitter<AppState<Itinerary>> emit,
  ) async {
    emit(const AppLoading());
    final dataState = await _getItineraryUseCase(params: event.params);
    if (dataState is DataSuccess) {
      emit(AppSuccess(dataState.data!));
    } else {
      emit(AppFailure(dataState.exception!));
    }
  }
}
