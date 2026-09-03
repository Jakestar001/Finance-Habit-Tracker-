import 'package:google_generative_ai/google_generative_ai.dart';

class AiChatService {
  late final GenerativeModel _model;
late final ChatSession _chat;
  AiChatService(String apiKey) {
    _model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
    );
  }
_chat = _model.startChat(); 
  Future<String?> sendMessage(String message) async {
    final response = await _chat.sendMessage(Content.text(message));
    return response.text;
  }
}
