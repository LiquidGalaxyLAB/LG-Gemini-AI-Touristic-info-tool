import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/theme/app_theme.dart';
import '../../../core/utils/app_utils.dart';
import '../../../domain/model/chat_item.dart';
import '../../../service/speech_to_text_service.dart';
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
  late ImagePicker _imagePicker;
  bool isListening = false;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _speechService = SpeechToTextService(onResult: (String text) {
      setState(() {
        _controller.text = text;
      });
    }, onListening: (result) {
      setState(() {
        isListening = result;
      });
    });
  }

  void _onSendClick(String message) {
    _controller.clear();
    _message = message;
    _chats.add(ChatItem(isMe: true, message: _message, image: _image));
    _image = null;
    setState(() {});
    BlocProvider.of<ChatBloc>(context).add(GetChatReply(_chats));
  }

  void _onAudioClick() {
    if (isListening) {
      _speechService.stopListening();
    } else {
      _speechService.startListening();
    }
  }

  Future<void> _onAttachClick() async {
    _image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

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
              child: Stack(
                children: [
                  chatBlocBuilder<ChatBloc, String>(onSuccess: (message) {
                    if (_chats.isNotEmpty) {
                      _chats.removeLast();
                    }
                    _chats.add(ChatItem(isMe: false, message: message));
                    return _buildList();
                  }, onLoading: () {
                    _chats.add(ChatItem(isMe: true, message: _message, image: _image));
                    _chats.add(const ChatItem(isMe: false, message: "Typing...", image: null));
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
                  if (_image != null)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        onTap: () {
                          _image = null;
                          setState(() {});
                        },
                        child: Container(
                          constraints: const BoxConstraints(maxHeight: 50, maxWidth: 70),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.file(
                              File(_image!.path),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          InputCard(
            controller: _controller,
            onAttachClick: _onAttachClick,
            onAudioClick: _onAudioClick,
            onSendClick: _onSendClick,
            isListening: isListening,
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
              image: _chats[index].image,
            ),
            if (index < _chats.length - 1) const SizedBox(height: 24.0)
          ],
        );
      },
    );
  }
}
