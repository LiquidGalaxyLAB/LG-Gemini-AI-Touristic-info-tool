import 'package:touristic/core/usecases/usecase.dart';

import '../repository/gemini_repository.dart';

class GetItineraryUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetItineraryUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}