import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/app_state.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/usecases/get_chat_reply_usecase.dart';
import 'chat_event.dart';

class ChatBloc extends Bloc<ChatEvent, AppState<String>> {
  final GetChatReplyUseCase _getChatReplyUseCase;

  ChatBloc(
    this._getChatReplyUseCase,
  ) : super(const AppLoading()) {
    on<GetChatReply>(onGetChatReply);
  }

  void onGetChatReply(
    GetChatReply event,
    Emitter<AppState<String>> emit,
  ) async {
    final dataState = await _getChatReplyUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(AppSuccess(dataState.data!));
    } else {
      emit(AppFailure(dataState.exception!));
    }
  }
}
