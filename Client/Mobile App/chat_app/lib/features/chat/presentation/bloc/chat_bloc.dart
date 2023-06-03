import 'package:bloc/bloc.dart';
import 'package:chat_app/core/network/network_info.dart';
import 'package:equatable/equatable.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/usecases/usecase.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:chat_app/features/chat/domain/usecases/get_chat_messages_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/send_message_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatMessagesUsecase getChatMessagesUsecase;
  final SendMessageUsecase sendMessageUsecase;

  ChatBloc({
    required this.getChatMessagesUsecase,
    required this.sendMessageUsecase,
  }) : super(ChatInitial());

  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is FetchChatMessages) {
      yield ChatLoading();
      final result = await getChatMessagesUsecase(NoParams());
      yield* result.fold(
        (failure) async* {
          yield ChatError(errorMessage: _mapFailureToMessage(failure));
        },
        (messages) async* {
          yield ChatLoaded(messages: messages);
        },
      );
    } else if (event is SendMessage) {
      yield ChatSending();
      final result = await sendMessageUsecase(SendMessageParams(message: event.message) as String);
      yield* result.fold(
        (failure) async* {
          yield ChatError(errorMessage: _mapFailureToMessage(failure));
        },
        (_) async* {
          yield ChatSent();
        },
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server error';
    } else if (failure is NetworkInfo) {
      return 'Network error';
    }
    return 'Unknown error';
  }
}
