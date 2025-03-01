part of 'characters_bloc.dart';

sealed class CharactersState extends Equatable {}

final class CharactersInitial extends CharactersState {
  @override
  List<Object?> get props => [];
}

// final class CharactersLoading extends CharactersState {
//   @override
//   List<Object?> get props => [];
// }

final class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  final bool hasReachedEnd;
  final bool isLoadingMore;

  CharactersLoaded({required this.characters, required this.hasReachedEnd, this.isLoadingMore = false});

  @override
  List<Object?> get props => [characters, hasReachedEnd, isLoadingMore];
}

final class CharactersError extends CharactersState {
  final String message;

  CharactersError({required this.message});

  @override
  List<Object?> get props => [message];
}
