part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {}
final class CharactersFetch extends CharactersEvent {
  final Completer? completer;

  CharactersFetch({this.completer});

  @override
  List<Object?> get props => [completer];
}
