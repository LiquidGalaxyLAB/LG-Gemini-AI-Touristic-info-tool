import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../repository/gemini_repository.dart';

class GetChatReplyUseCase implements UseCase<DataState<String>, Map<String, dynamic>> {
  final GeminiRepository _geminiRepository;
  GetChatReplyUseCase(this._geminiRepository);

  @override
  Future<DataState<String>> call({Map<String, dynamic>? params}) {
    return _geminiRepository.getChatReply(params!);
  }

}