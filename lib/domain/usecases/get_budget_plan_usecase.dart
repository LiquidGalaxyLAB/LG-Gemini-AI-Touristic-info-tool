import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class GetBudgetPlanUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetBudgetPlanUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}