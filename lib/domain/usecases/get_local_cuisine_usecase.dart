import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/cuisine.dart';
import '../repository/gemini_repository.dart';

class GetLocalCuisineUseCase
    implements UseCase<DataState<List<Cuisine>>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetLocalCuisineUseCase(this._geminiRepository);

  @override
  Future<DataState<List<Cuisine>>> call(params) {
    return _geminiRepository.getLocalCuisine(params);
  }
}
