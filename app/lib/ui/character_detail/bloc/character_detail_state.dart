part of 'character_detail_bloc.dart';

sealed class CharacterDetailState {}

final class CharacterDetailLoading extends CharacterDetailState {}

final class CharacterDetailLoaded extends CharacterDetailState {
  final CharacterDetail character;

  CharacterDetailLoaded({required this.character});
}

final class CharacterDetailError extends CharacterDetailState {
  final String message;

  CharacterDetailError({required this.message});
}
