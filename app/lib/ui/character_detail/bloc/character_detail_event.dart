part of 'character_detail_bloc.dart';

sealed class CharacterDetailEvent {}

final class CharacterDetailFetch extends CharacterDetailEvent {
  final int id;

  CharacterDetailFetch({required this.id});
}
