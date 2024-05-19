import '../../core/usecases/usecase.dart';
import '../model/tourist_place.dart';
import '../repository/gemini_repository.dart';

class AddFavouriteUseCase implements UseCase<bool, TouristPlace> {
  final GeminiRepository _geminiRepository;

  AddFavouriteUseCase(this._geminiRepository);

  @override
  Future<bool> call({TouristPlace? params}) {
    return _geminiRepository.addFavourite(params!);
  }
}
