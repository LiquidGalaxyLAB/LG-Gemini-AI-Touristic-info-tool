import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../domain/model/activitiy.dart';
import '../../../../domain/usecases/get_activities_usecase.dart';
import 'activities_event.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, AppState<List<Activity>>> {
  final GetActivitiesUseCase _getActivitiesUseCase;

  ActivitiesBloc(
    this._getActivitiesUseCase,
  ) : super(const AppEmpty()) {
    on<GetActivities>(onGetActivities);
  }

  void onGetActivities(
    GetActivities event,
    Emitter<AppState<List<Activity>>> emit,
  ) async {
    emit(const AppLoading());
    final dataState = await _getActivitiesUseCase(params: event.params);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(AppSuccess(dataState.data!));
    } else {
      emit(AppFailure(dataState.exception!));
    }
  }
}
