import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../domain/model/cuisine.dart';
import '../../../../domain/usecases/get_local_cuisine_usecase.dart';
import 'cuisines_event.dart';

class CuisinesBloc extends Bloc<CuisinesEvent, AppState<List<Cuisine>>> {
  final GetLocalCuisineUseCase _getCuisinesUseCase;

  CuisinesBloc(
    this._getCuisinesUseCase,
  ) : super(const AppEmpty()) {
    on<GetCuisines>(onGetCuisines);
  }

  void onGetCuisines(
    GetCuisines event,
    Emitter<AppState<List<Cuisine>>> emit,
  ) async {
    emit(const AppLoading());
    final dataState = await _getCuisinesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(AppSuccess(dataState.data!));
    } else {
      emit(AppFailure(dataState.exception!));
    }
  }
}
