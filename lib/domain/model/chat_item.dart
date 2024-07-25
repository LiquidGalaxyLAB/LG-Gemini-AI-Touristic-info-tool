import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ChatItem extends Equatable {
  final bool isMe;
  final String message;
  final XFile? image;

  const ChatItem({
    required this.isMe,
    required this.message,
    this.image,
  });

  @override
  List<Object?> get props => [isMe, message, image];
}
