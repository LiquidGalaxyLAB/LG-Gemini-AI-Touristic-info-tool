import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/recommendation.dart';
import '../repository/gemini_repository.dart';

class GetRecommendationsUseCase
    implements UseCase<DataState<List<Recommendation>>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetRecommendationsUseCase(this._geminiRepository);

  @override
  Future<DataState<List<Recommendation>>> call(params) {
    return _geminiRepository.getRecommendations(params);
  }
}
