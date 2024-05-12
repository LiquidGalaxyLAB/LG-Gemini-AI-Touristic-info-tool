import 'package:touristic/core/usecases/usecase.dart';
import 'package:touristic/features/home/domain/repository/gemini_repository.dart';

class GetTouristPlacesUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetTouristPlacesUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}