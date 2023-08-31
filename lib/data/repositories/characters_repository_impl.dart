import 'package:casino_test/domain/domain.dart';
import 'package:casino_test/core/core.dart';
import 'package:casino_test/data/data.dart';

import 'package:casino_test/core/services/network/network.dart';

class CharacterRepositoryImp implements CharacterRepository {
  final ServerSource server;
  final InternetInfo internetInfo;

  const CharacterRepositoryImp({required this.server, required this.internetInfo});

  @override
  Future<Result<Failure, List<Character>>> getCharacters({required int page}) async {
    try {
      if (await internetInfo.hasConnection()) {
        final result = await server.getCharacters(page);
        return Success(result);
      } else {
        return Error(NotConnectedFailure());
      }
    } on ServerException {
      return Error(ServerFailure());
    }
  }
}
