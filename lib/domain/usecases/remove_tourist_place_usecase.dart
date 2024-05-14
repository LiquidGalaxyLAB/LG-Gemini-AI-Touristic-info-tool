import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class RemoveTouristPlaceUseCase implements UseCase {
  final GeminiRepository _geminiRepository;
  RemoveTouristPlaceUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}