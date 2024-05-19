import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/tourist_place.dart';
import '../repository/gemini_repository.dart';

class GetTouristPlacesUseCase
    implements UseCase<DataState<List<TouristPlace>>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetTouristPlacesUseCase(this._geminiRepository);

  @override
  Future<DataState<List<TouristPlace>>> call({Map<String, dynamic>? params}) {
    return _geminiRepository.getTouristPlaces(params!);
  }
}
