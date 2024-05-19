import '../../core/usecases/usecase.dart';
import '../model/tourist_place.dart';
import '../repository/gemini_repository.dart';

class RemoveFavouriteUseCase
    implements UseCase<bool, TouristPlace> {
  final GeminiRepository _geminiRepository;

  RemoveFavouriteUseCase(this._geminiRepository);

  @override
  Future<bool> call({TouristPlace? params}) {
    return _geminiRepository.removeFavourite(params!);
  }
}
