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
  final ScrollController _scrollController = ScrollController();
  final List<ChatItem> _chats = [];

  late SpeechToTextService _speechService;
  late ImagePicker _imagePicker;

  String _message = "";
  bool isListening = false;
  bool _showImagePreview = false;
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
    if (message.isNotEmpty) {
      _controller.clear();
      _message = message;
      _chats.add(ChatItem(isMe: true, message: _message, image: _image));
      BlocProvider.of<ChatBloc>(context).add(GetChatReply(_chats));
      _showImagePreview = false;
      setState(() {});
    } else {
      if (_image != null) {
        _showSnackbar("Please add a text prompt before sending the image.");
      }
    }
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
    if (_image != null) {
      setState(() {
        _showImagePreview = true;
      });
    }
  }

  _scrollToLast() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 150),
      curve: Curves.fastOutSlowIn,
    );
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
                    _image = null;
                    _scrollToLast();
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
                  if (_showImagePreview && _image != null)
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
      controller: _scrollController,
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

  void _showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: AppTheme.gray.shade300,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: AppTheme.gray.shade800,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
