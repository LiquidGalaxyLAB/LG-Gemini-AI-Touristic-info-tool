import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class GetLocalCuisineUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetLocalCuisineUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}