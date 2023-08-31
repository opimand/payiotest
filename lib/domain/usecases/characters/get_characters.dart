import 'package:casino_test/domain/domain.dart';
import 'package:casino_test/core/utils/generics/usecase.dart';
import 'package:casino_test/core/core.dart';

class GetCharactersUseCase implements UseCase<List<Character>, int> {
  final CharacterRepository repository;

  const GetCharactersUseCase({
    required this.repository,
  });

  @override
  Future<Result<Failure, List<Character>>> call(int page) {
    return repository.getCharacters(page: page);
  }
}
