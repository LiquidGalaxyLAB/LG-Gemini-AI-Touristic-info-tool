import 'package:touristic/core/usecases/usecase.dart';
import 'package:touristic/features/home/domain/repository/gemini_repository.dart';

class GetActivitiesUseCase implements UseCase<dynamic, dynamic> {
  final GeminiRepository _geminiRepository;
  GetActivitiesUseCase(this._geminiRepository);

  @override
  Future call(params) {
    throw UnimplementedError();
  }

}