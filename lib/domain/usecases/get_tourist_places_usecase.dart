import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class GetTouristPlacesUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetTouristPlacesUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}