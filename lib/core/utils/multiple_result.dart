import 'package:meta/meta.dart';

@sealed
abstract class Result<E, S> {
  const Result();
  dynamic get();

  S? getSuccess();

  E? getError();

  bool isError();

  bool isSuccess();

  W when<W>(
    W Function(E error) whenError,
    W Function(S success) whenSuccess,
  );
}

@immutable
class Success<E, S> implements Result<E, S> {
  const Success(
    this._success,
  );

  final S _success;

  @override
  S get() {
    return _success;
  }

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  int get hashCode => _success.hashCode;

  @override
  bool operator ==(Object other) => other is Success && other._success == _success;

  @override
  W when<W>(
    W Function(E error) whenError,
    W Function(S success) whenSuccess,
  ) {
    return whenSuccess(_success);
  }

  @override
  E? getError() => null;

  @override
  S? getSuccess() => _success;
}

@immutable
class Error<E, S> implements Result<E, S> {
  const Error(this._error);

  final E _error;

  @override
  E get() {
    return _error;
  }

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  int get hashCode => _error.hashCode;

  @override
  bool operator ==(Object other) => other is Error && other._error == _error;

  @override
  W when<W>(
    W Function(E error) whenError,
    W Function(S succcess) whenSuccess,
  ) {
    return whenError(_error);
  }

  @override
  E? getError() => _error;

  @override
  S? getSuccess() => null;
}

class SuccessResult {
  const SuccessResult._internal();
}

const success = SuccessResult._internal();
