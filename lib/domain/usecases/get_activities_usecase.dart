import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/activities.dart';
import '../repository/gemini_repository.dart';

class GetActivitiesUseCase implements UseCase<DataState<Activities>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;
  GetActivitiesUseCase(this._geminiRepository);

  @override
  Future<DataState<Activities>> call(params) {
    return _geminiRepository.getActivities(params);
  }

}