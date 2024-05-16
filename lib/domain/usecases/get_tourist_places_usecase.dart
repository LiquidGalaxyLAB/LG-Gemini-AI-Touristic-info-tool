import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/tourist_places.dart';
import '../repository/gemini_repository.dart';

class GetTouristPlacesUseCase
    implements UseCase<DataState<TouristPlaces>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;

  GetTouristPlacesUseCase(this._geminiRepository);

  @override
  Future<DataState<TouristPlaces>> call(params) {
    return _geminiRepository.getTouristPlaces(params);
  }
}
