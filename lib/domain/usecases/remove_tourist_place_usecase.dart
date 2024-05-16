import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/tourist_place.dart';
import '../repository/gemini_repository.dart';

class RemoveTouristPlaceUseCase
    implements UseCase<DataState<bool>, TouristPlace> {
  final GeminiRepository _geminiRepository;

  RemoveTouristPlaceUseCase(this._geminiRepository);

  @override
  Future<DataState<bool>> call(params) {
    return _geminiRepository.removeTouristPlace(params);
  }
}
