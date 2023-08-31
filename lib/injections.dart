import 'package:casino_test/domain/domain.dart';
import 'package:casino_test/presentation/bloc/character/character_bloc.dart';
import 'package:connecteo/connecteo.dart';
import 'package:get_it/get_it.dart';
import 'package:casino_test/core/core.dart';
import 'package:casino_test/data/data.dart';
import 'package:http/http.dart' as http;

import 'package:casino_test/core/services/network/network.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // INIT BLOCS
  getIt.registerFactory(() => CharacterBloc(getCharactersUseCase: getIt()));

  //SERVICES REGISTER
  getIt.registerLazySingleton<ConnectionChecker>(
    () => ConnectionChecker(),
  );

  getIt.registerLazySingleton<InternetInfo>(() => InternetInfoImp(checker: getIt()));

  getIt.registerLazySingleton<ServerSource>(() => ServerSourceImp(client: http.Client()));

  //  REPOSITORIES REGISTER
  getIt.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImp(internetInfo: getIt(), server: getIt()));

  //  USE CASES REGISTER
  getIt.registerLazySingleton<GetCharactersUseCase>(
      () => GetCharactersUseCase(repository: getIt<CharacterRepository>()));
}
