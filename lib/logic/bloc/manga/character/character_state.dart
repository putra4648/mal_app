part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoadedSuccess extends CharacterState {
  final List<Character> characters;

  const CharacterLoadedSuccess({required this.characters});

  CharacterLoadedSuccess copyWith({
    required List<Character> characters,
  }) {
    return CharacterLoadedSuccess(
      characters: this.characters,
    );
  }

  @override
  List<Object> get props => [characters];
}

class CharacterFailure extends CharacterState {}
