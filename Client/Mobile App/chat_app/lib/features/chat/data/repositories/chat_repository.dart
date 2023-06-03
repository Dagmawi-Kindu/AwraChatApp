import '../datasources/chat_remote_data_source.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';

abstract class ChatRepository {
  Future<List<MessageModel>> getChatMessages();
  Future<void> sendMessage(String message);
}

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource, {required, required Object networkInfo });

  @override
  Future<List<MessageModel>> getChatMessages() {
    return remoteDataSource.getChatMessages();
  }

  @override
  Future<void> sendMessage(String message) {
    return remoteDataSource.sendMessage(message);
  }
}
