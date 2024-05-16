import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/itinerary.dart';
import '../repository/gemini_repository.dart';

class GetItineraryUseCase
    implements UseCase<DataState<Itinerary>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetItineraryUseCase(this._geminiRepository);

  @override
  Future<DataState<Itinerary>> call(params) {
    return _geminiRepository.getItinerary(params);
  }
}
