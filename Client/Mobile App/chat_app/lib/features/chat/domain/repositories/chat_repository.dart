import 'package:chat_app/features/chat/data/models/message_model.dart';

abstract class ChatRepository {
  Future<List<MessageModel>> getChatMessages();
  Future<void> sendMessage(String message);
}
