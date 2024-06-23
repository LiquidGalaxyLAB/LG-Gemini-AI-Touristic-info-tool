import 'package:equatable/equatable.dart';

class ChatItem extends Equatable {
  final bool isMe;
  final String message;

  const ChatItem({
    required this.isMe,
    required this.message,
  });

  @override
  List<Object?> get props => [isMe, message];
}
