import 'package:chat_app/features/chat/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
    required String id,
    required String content,
    required DateTime timestamp,
  }) : super(id: id, content: content, timestamp: timestamp);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    // Parse JSON and create a MessageModel instance
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    // Convert MessageModel instance to JSON
    throw UnimplementedError();
  }
}
