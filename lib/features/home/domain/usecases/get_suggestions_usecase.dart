import 'package:touristic/core/usecases/usecase.dart';
import 'package:touristic/features/home/domain/repository/gemini_repository.dart';

class GetSuggestionsUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetSuggestionsUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}