import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  final Map<String, dynamic>? params;

  const ChatEvent({this.params});

  @override
  List<Object> get props => [params!];
}

class GetChatReply extends ChatEvent {
  const GetChatReply(Map<String, dynamic> params): super(params: params);
}