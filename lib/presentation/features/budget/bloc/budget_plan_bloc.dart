import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/app_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../domain/model/budget_plan.dart';
import '../../../../domain/usecases/get_budget_plan_usecase.dart';
import 'budget_plan_event.dart';

class BudgetPlanBloc extends Bloc<BudgetPlanEvent, AppState<BudgetPlan>> {
  final GetBudgetPlanUseCase _getBudgetPlanUseCase;

  BudgetPlanBloc(
    this._getBudgetPlanUseCase,
  ) : super(const AppLoading()) {
    on<GetBudgetPlan>(onGetBudgetPlan);
  }

  void onGetBudgetPlan(
    GetBudgetPlan event,
    Emitter<AppState<BudgetPlan>> emit,
  ) async {
    final dataState = await _getBudgetPlanUseCase();
    if (dataState is DataSuccess) {
      emit(AppSuccess(dataState.data!));
    } else {
      emit(AppFailure(dataState.exception!));
    }
  }
}
