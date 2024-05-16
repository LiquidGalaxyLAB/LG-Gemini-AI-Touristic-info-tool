import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/recommendations.dart';
import '../repository/gemini_repository.dart';

class GetRecommendationsUseCase
    implements UseCase<DataState<Recommendations>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetRecommendationsUseCase(this._geminiRepository);

  @override
  Future<DataState<Recommendations>> call(params) {
    return _geminiRepository.getRecommendations(params);
  }
}
