import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  final String? reply;

  const ChatEvent({this.reply});

  @override
  List<Object> get props => [reply!];
}

class GetChatReply extends ChatEvent {
  const GetChatReply();
}