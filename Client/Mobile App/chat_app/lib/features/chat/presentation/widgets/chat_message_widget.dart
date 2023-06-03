import 'package:flutter/material.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';

class ChatMessageWidget extends StatelessWidget {
  final MessageModel message;

  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.content),
      subtitle: Text(message.timestamp.toString()),
    );
  }
}
