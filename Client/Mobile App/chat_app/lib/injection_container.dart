// ignore: duplicate_ignore
// ignore_for_file: unused_import, duplicate_ignore

import 'package:get_it/get_it.dart';
import 'package:chat_app/features/chat/data/datasources/chat_remote_data_source.dart';
// ignore: unused_import
import 'package:chat_app/features/chat/domain/usecases/get_chat_messages_usecase.dart';
import 'package:chat_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:chat_app/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_app/core/network/network_info.dart';
// ignore: duplicate_import
import 'package:chat_app/core/network/network_info.dart';
import 'package:http/http.dart' as http;

// ignore: unused_import
import 'features/chat/data/repositories/chat_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Chat
  // Bloc
  sl.registerFactory(
    () => ChatBloc(
      getChatMessagesUsecase: sl(),
      sendMessageUsecase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetChatMessagesUsecase(sl()));
  sl.registerLazySingleton(() => SendMessageUsecase(sl()));

  // Repository
  //sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl( remoteDataSource: sl(), networkInfo: sl(),),  );

  // Data sources
  //sl.registerLazySingleton<ChatRemoteDataSource>(() => ChatRemoteDataSourceImpl(client: sl(),),);

  // Core
 //sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // External
  sl.registerLazySingleton(() => http.Client());
}
