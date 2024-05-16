import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/cuisines.dart';
import '../repository/gemini_repository.dart';

class GetLocalCuisineUseCase
    implements UseCase<DataState<Cuisines>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetLocalCuisineUseCase(this._geminiRepository);

  @override
  Future<DataState<Cuisines>> call(params) {
    return _geminiRepository.getLocalCuisine(params);
  }
}
