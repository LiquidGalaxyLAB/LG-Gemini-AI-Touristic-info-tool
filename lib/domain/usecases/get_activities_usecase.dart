import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/activitiy.dart';
import '../repository/gemini_repository.dart';

class GetActivitiesUseCase implements UseCase<DataState<List<Activity>>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;
  GetActivitiesUseCase(this._geminiRepository);

  @override
  Future<DataState<List<Activity>>> call(params) {
    return _geminiRepository.getActivities(params);
  }

}