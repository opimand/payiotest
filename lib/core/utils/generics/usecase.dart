import 'package:casino_test/core/core.dart';

abstract class UseCase<Output, Input> {
  Future<Result<Failure, Output?>> call(Input input);
}
