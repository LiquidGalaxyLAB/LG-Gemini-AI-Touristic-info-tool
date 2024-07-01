import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../domain/model/recommendation.dart';
import '../../../../domain/usecases/get_recommendations_usecase.dart';
import 'recommendations_event.dart';

class RecommendationsBloc
    extends Bloc<RecommendationsEvent, AppState<List<Recommendation>>> {
  final GetRecommendationsUseCase _getRecommendationsUseCase;

  RecommendationsBloc(
    this._getRecommendationsUseCase,
  ) : super(const AppEmpty()) {
    on<GetRecommendations>(onGetRecommendations);
  }

  void onGetRecommendations(
    GetRecommendations event,
    Emitter<AppState<List<Recommendation>>> emit,
  ) async {
    emit(const AppLoading());
    final dataState = await _getRecommendationsUseCase(params: event.params);
    if (dataState is DataSuccess) {
      emit(AppSuccess(dataState.data!));
    } else {
      emit(AppFailure(dataState.exception!));
    }
  }
}
