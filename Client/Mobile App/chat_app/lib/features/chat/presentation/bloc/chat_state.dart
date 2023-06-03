part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageModel> messages;

  const ChatLoaded({required this.messages});

  @override
  List<Object?> get props => [messages];
}

class ChatSending extends ChatState {}

class ChatSent extends ChatState {}

class ChatError extends ChatState {
  final String errorMessage;

  const ChatError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
