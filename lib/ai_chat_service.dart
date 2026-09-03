import 'package:google_generative_ai/google_generative_ai.dart';

class AiChatService {
  late final GenerativeModel _model;

  AiChatService(String apiKey) {
    _model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
    );
  }

  Future<String?> sendMessage(String message) async {
    final content = [Content.text(message)];
    final response = await _model.generateContent(content);
    return response.text;
  }
}
