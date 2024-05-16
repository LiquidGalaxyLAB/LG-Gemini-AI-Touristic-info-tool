import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class ClearHistoryUseCase implements UseCase<DataState<bool>, void> {
  final GeminiRepository _geminiRepository;

  ClearHistoryUseCase(this._geminiRepository);

  @override
  Future<DataState<bool>> call(params) {
    return _geminiRepository.clearHistory();
  }
}
