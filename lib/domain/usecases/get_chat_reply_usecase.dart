import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../model/chat_item.dart';
import '../repository/gemini_repository.dart';

class GetChatReplyUseCase implements UseCase<DataState<String>, List<ChatItem>> {
  final GeminiRepository _geminiRepository;
  GetChatReplyUseCase(this._geminiRepository);

  @override
  Future<DataState<String>> call({List<ChatItem>? params}) {
    return _geminiRepository.getChatReply(params!);
  }

}