import 'package:equatable/equatable.dart';

import '../../../../domain/model/chat_item.dart';

abstract class ChatEvent extends Equatable {
  final List<ChatItem>? params;

  const ChatEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetChatReply extends ChatEvent {
  const GetChatReply(List<ChatItem> params) : super(params: params);
}
