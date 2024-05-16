import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/tourist_place.dart';
import '../repository/gemini_repository.dart';

class GetHistoryPlaceUseCase
    implements UseCase<DataState<List<TouristPlace>>, void> {
  final GeminiRepository _geminiRepository;

  GetHistoryPlaceUseCase(this._geminiRepository);

  @override
  Future<DataState<List<TouristPlace>>> call(params) {
    return _geminiRepository.getHistory();
  }
}
