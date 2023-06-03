import 'package:chat_app/features/chat/data/models/message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<MessageModel>> getChatMessages();
  Future<void> sendMessage(String message);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  @override
  Future<List<MessageModel>> getChatMessages() {
    // Implementation to retrieve chat messages from a remote API
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(String message) {
    // Implementation to send a message to the chat API
    throw UnimplementedError();
  }
}
