import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIChatScreen extends StatefulWidget {
 const AIChatScreen({Key? key}) : super(key: key);

 @override
 State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
 final TextEditingController _textController = TextEditingController();
 final ScrollController _scrollController = ScrollController();
 final List<ChatMessage> _messages = [];
 bool _isLoading = false;
 late final GenerativeModel _model;
 late final ChatSession _chat;

 @override
 void initState() {
 super.initState();
 // Initialize the model with your API key
 // Replace YOUR_API_KEY with your actual Gemini API key
 const apiKey = 'dotenv.env['API_KEY']';
 _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
 _chat = _model.startChat();
 }

 Future<void> _sendMessage() async {
 final messageText = _textController.text.trim();
 if (messageText.isEmpty) return;

 setState(() {
 _isLoading = true;
 _messages.add(ChatMessage(text: messageText, isUser: true));
 });

 _textController.clear();
 _scrollToBottom();

 try {
 final response = await _chat.sendMessage(Content.text(messageText));
 setState(() {
 _messages.add(ChatMessage(
 text: response.text ?? 'No response received.',
 isUser: false,
 ));
 });
 } catch (e) {
 setState(() {
 _messages.add(ChatMessage(
 text: 'Error: ${e.toString()}',
 isUser: false,
 ));
 });
 } finally {
 setState(() {
 _isLoading = false;
 });
 _scrollToBottom();
 }
 }

 void _scrollToBottom() {
 WidgetsBinding.instance.addPostFrameCallback((_) {
 if (_scrollController.hasClients) {
 _scrollController.animateTo(
 _scrollController.position.maxScrollExtent,
 duration: const Duration(milliseconds: 300),
 curve: Curves.easeOut,
 );
 }
 });
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: const Text('AI Chat Assistant')),
 body: Column(
 children: [
 Expanded(
 child: ListView.builder(
 controller: _scrollController,
 itemCount: _messages.length,
 itemBuilder: (context, index) {
 final message = _messages[index];
 return Align(
 alignment: message.isUser
 ? Alignment.centerRight
 : Alignment.centerLeft,
 child: Container(
 margin: const EdgeInsets.symmetric(
 vertical: 8.0,
 horizontal: 16.0,
 ),
 padding: const EdgeInsets.all(12.0),
 decoration: BoxDecoration(
 color: message.isUser
 ? Colors.blueAccent
 : Colors.grey[300],
 borderRadius: BorderRadius.circular(8.0),
 ),
 child: Text(
 message.text,
 style: TextStyle(
 color: message.isUser ? Colors.white : Colors.black,
 ),
 ),
 ),
 );
 },
 ),
 ),
 if (_isLoading)
 const Padding(
 padding: EdgeInsets.all(8.0),
 child: CircularProgressIndicator(),
 ),
 Padding(
 padding: const EdgeInsets.all(8.0),
 child: Row(
 children: [
 Expanded(
 child: TextField(
 controller: _textController,
 decoration: const InputDecoration(
 hintText: 'Type a message...',
 border: OutlineInputBorder(),
 ),
 ),
 ),
 IconButton(
 icon: const Icon(Icons.send),
 onPressed: _sendMessage,
 ),
 ],
 ),
 ),
 ],
 ),
 );
 }
}

class ChatMessage {
 final String text;
 final bool isUser;

 ChatMessage({required this.text, required this.isUser});
}
