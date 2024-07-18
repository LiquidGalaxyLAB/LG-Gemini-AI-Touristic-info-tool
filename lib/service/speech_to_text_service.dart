import 'dart:developer';

import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final Function(String) _onSpeechResult;
  final Function(bool) _onListening;

  SpeechToTextService({
    required Function(String) onResult,
    required Function(bool) onListening,
  }) : _onSpeechResult = onResult,
      _onListening = onListening;

  bool get isListening => _speech.isListening;

  Future<bool> _isInitialized() async {
    if (!_speech.isAvailable) {
      return await _speech.initialize(
        onStatus: (status) {
          log('Speech recognition status: $status');
          if (status == "listening") {
            _onListening(true);
          } else  {
            _onListening(false);
          }
        },
        onError: (errorNotification) {
          _onListening(false);
          log('Error occurred in speech recognition: $errorNotification');
        },
      );
    }
    return true;
  }

  Future<void> startListening() async {
    if (await _isInitialized()) {
      if (!_speech.isListening) {
        _speech.listen(
          onResult: (result) {
            _onSpeechResult(result.recognizedWords);
            _onListening(true);
          },
        );
      }
    }
  }

  void stopListening() {
    if (_speech.isListening) {
      _speech.stop();
      _onListening(false);
    }
  }
}
