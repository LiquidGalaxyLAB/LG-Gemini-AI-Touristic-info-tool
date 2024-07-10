import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touristic/service/speech_to_text_service.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/utils/app_utils.dart';
import '../../../domain/model/chat_item.dart';
import '../../components/no_data_card.dart';
import 'bloc/chat_bloc.dart';
import 'bloc/chat_event.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/input_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  final List<ChatItem> _chats = [];
  String _message = "";

  late SpeechToTextService _speechService;

  @override
  void initState() {
    super.initState();
    _speechService = SpeechToTextService(
      onResult: (String text) {
        setState(() {
          _controller.text = text;
        });
      },
    );
  }

  void _onSendClick(String message) {
    _controller.clear();
    _speechService.stopListening();
    _message = message;
    _chats.add(ChatItem(isMe: true, message: _message));
    BlocProvider.of<ChatBloc>(context).add(GetChatReply(_chats));
  }

  void _onAudioClick() {
    _speechService.startListening();
  }

  void _onAttachClick() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      color: AppTheme.gray.shade900,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppTheme.gray.shade800,
              ),
              child: chatBlocBuilder<ChatBloc, String>(onSuccess: (message) {
                if (_chats.isNotEmpty) {
                  _chats.removeLast();
                }
                _chats.add(ChatItem(isMe: false, message: message));
                return _buildList();
              }, onLoading: () {
                _chats.add(ChatItem(isMe: true, message: _message));
                _chats.add(const ChatItem(isMe: false, message: "Typing..."));
                return _buildList();
              }, onError: () {
                if (_chats.isNotEmpty) {
                  _chats.removeLast();
                }
                return _buildList();
              }, onEmpty: () {
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [NoDataCard()],
                );
              }),
            ),
          ),
          const SizedBox(height: 12.0),
          InputCard(
            controller: _controller,
            onAttachClick: _onAttachClick,
            onAudioClick: _onAudioClick,
            onSendClick: _onSendClick,
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ChatBubble(
              isMe: _chats[index].isMe,
              message: _chats[index].message,
            ),
            if (index < _chats.length - 1) const SizedBox(height: 24.0)
          ],
        );
      },
    );
  }
}
