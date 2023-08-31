part of 'character_bloc.dart';

enum Status { empty, loading, loaded, serverError, networkError, itemNotFound }

class CharacterState extends Equatable {
  final Status status;
  final List<Character> characters;
  final Character? currentCharacter;
  final bool hasReachedMax;

  const CharacterState({
    required this.status,
    required this.characters,
    this.hasReachedMax = false,
    this.currentCharacter,
  });

  @override
  List<Object?> get props => [status, characters, currentCharacter, hasReachedMax];

  CharacterState copyWith({
    Status? status,
    List<Character>? characters,
    Character? currentCharacter,
    bool? hasReachedMax,
  }) {
    return CharacterState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      currentCharacter: currentCharacter ?? this.currentCharacter,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
