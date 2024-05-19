import '../../core/usecases/usecase.dart';
import '../model/tourist_place.dart';
import '../repository/gemini_repository.dart';

class GetFavouritesUseCase
    implements UseCase<List<TouristPlace>, void> {
  final GeminiRepository _geminiRepository;

  GetFavouritesUseCase(this._geminiRepository);

  @override
  Future<List<TouristPlace>> call({void params}) {
    return _geminiRepository.getFavourites();
  }
}
