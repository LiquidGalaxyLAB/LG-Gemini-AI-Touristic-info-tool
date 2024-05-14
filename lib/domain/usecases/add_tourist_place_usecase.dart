import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class AddTouristPlaceUseCase implements UseCase {
  final GeminiRepository _geminiRepository;
  AddTouristPlaceUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}