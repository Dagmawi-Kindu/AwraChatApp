import 'package:dartz/dartz.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/usecases/usecase.dart';
import 'package:chat_app/features/chat/data/models/message_model.dart';
import 'package:chat_app/features/chat/domain/repositories/chat_repository.dart';

class GetChatMessagesUsecase implements UseCase<List<MessageModel>, NoParams> {
  final ChatRepository repository;

  GetChatMessagesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MessageModel>>> call(NoParams params) async {
    try {
      final messages = await repository.getChatMessages();
      return Right(messages);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
