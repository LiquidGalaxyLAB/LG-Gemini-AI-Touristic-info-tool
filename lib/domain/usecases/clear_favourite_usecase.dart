import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class ClearFavouritesUseCase implements UseCase<bool, void> {
  final GeminiRepository _geminiRepository;

  ClearFavouritesUseCase(this._geminiRepository);

  @override
  Future<bool> call({void params}) {
    return _geminiRepository.clearFavourites();
  }
}
