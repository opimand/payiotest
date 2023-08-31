import 'package:casino_test/domain/entities/character.dart';

import 'package:casino_test/core/core.dart';

abstract class CharacterRepository {
  Future<Result<Failure, List<Character>>> getCharacters({
    required int page,
  });
}
