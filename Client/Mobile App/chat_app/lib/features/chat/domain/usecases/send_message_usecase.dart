import 'package:dartz/dartz.dart';
import 'package:chat_app/core/error/failure.dart';
import 'package:chat_app/core/usecases/usecase.dart';
import 'package:chat_app/features/chat/domain/repositories/chat_repository.dart';
import 'package:equatable/equatable.dart';

class SendMessageUsecase implements UseCase<void, String> {
  final ChatRepository repository;

  SendMessageUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(String message) async {
    try {
      await repository.sendMessage(message);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
class SendMessageParams extends Equatable {
  final String message;

  const SendMessageParams({required this.message});

  @override
  List<Object?> get props => [message];
}