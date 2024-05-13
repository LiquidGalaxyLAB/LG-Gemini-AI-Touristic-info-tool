import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class GetRecommendationsUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetRecommendationsUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}