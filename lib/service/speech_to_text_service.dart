import 'dart:developer';

import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final Function(String) onSpeechResult;

  SpeechToTextService({
    required Function(String) onResult,
  }) : onSpeechResult = onResult;

  bool get isListening => _speech.isListening;

  Future<bool> _isInitialized() async {
    if (!_speech.isAvailable) {
      return await _speech.initialize(
        onStatus: (status) => log('Speech recognition status: $status'),
        onError: (errorNotification) => log('Error occurred in speech recognition: $errorNotification'),
      );
    }
    return true;
  }

  Future<void> startListening() async {
    if (await _isInitialized()) {
      if (!_speech.isListening) {
        _speech.listen(
          onResult: (result) {
            onSpeechResult(result.recognizedWords);
          },
        );
      }
    }
  }

  void stopListening() {
    if (_speech.isListening) {
      _speech.stop();
    }
  }
}
