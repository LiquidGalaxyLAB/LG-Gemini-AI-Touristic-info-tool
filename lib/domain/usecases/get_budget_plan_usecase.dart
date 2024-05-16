import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/budget_plan.dart';
import '../repository/gemini_repository.dart';

class GetBudgetPlanUseCase
    implements UseCase<DataState<BudgetPlan>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetBudgetPlanUseCase(this._geminiRepository);

  @override
  Future<DataState<BudgetPlan>> call(params) {
    return _geminiRepository.getBudgetPlan(params);
  }
}
