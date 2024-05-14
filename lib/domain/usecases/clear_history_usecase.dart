import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class ClearHistoryUseCase implements UseCase {
  final GeminiRepository _geminiRepository;
  ClearHistoryUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}