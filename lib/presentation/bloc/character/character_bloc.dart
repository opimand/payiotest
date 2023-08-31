import 'package:casino_test/core/core.dart';
import 'package:casino_test/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'character_event.dart';
part 'character_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase getCharactersUseCase;
  static const int pageSize = 20;
  CharacterBloc({required this.getCharactersUseCase})
      : super(const CharacterState(status: Status.empty, characters: [])) {
    on<CharactersOnGet>(
      _onGetCharacters,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  int _currentPage = 1;
  bool _reachedEnd = false;

  Future<void> _onGetCharacters(CharactersOnGet event, Emitter<CharacterState> emit) async {
    // emit(state.copyWith(status: Status.loading));
    if (_reachedEnd) return;
    if (state.status != Status.loading && !_reachedEnd) {
      emit(state.copyWith(status: Status.loading));

      final result = await getCharactersUseCase(_currentPage);

      if (result.isSuccess()) {
        final newCharacters = result.getSuccess();
        if (newCharacters != null) {
          if (newCharacters.length < pageSize) {
            _reachedEnd = true;
          } else {
            _currentPage++;
          }
          emit(state.copyWith(
            characters: [...state.characters, ...newCharacters],
            status: Status.loaded,
            hasReachedMax: _reachedEnd,
          ));
        }
      } else {
        if (result.getError() is ServerFailure) {
          emit(state.copyWith(status: Status.serverError));
        } else if (result.getError() is NotConnectedFailure) {
          emit(state.copyWith(status: Status.networkError));
        }
      }
    }
  }
}
