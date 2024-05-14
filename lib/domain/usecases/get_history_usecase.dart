import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class GetHistoryPlaceUseCase implements UseCase {
  final GeminiRepository _geminiRepository;
  GetHistoryPlaceUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}