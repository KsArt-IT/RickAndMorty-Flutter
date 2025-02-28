import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain/entity/entity.dart';
import 'package:rick_and_morty/domain/entity/result.dart';
import 'package:rick_and_morty/domain/repository/character_repository.dart';
part 'characters_event.dart';
part 'characters_state.dart';

final class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository _characterRepository;
  int _page = 1;

  CharactersBloc({required CharacterRepository characterRepository})
    : _characterRepository = characterRepository,
      super(CharactersInitial()) {
    on<CharactersFetch>(_onCharactersFetch);
  }

  void _onCharactersFetch(
    CharactersFetch event,
    Emitter<CharactersState> emit,
  ) async {
    emit(CharactersLoading());
    debugPrint('CharactersBloc::_onCharactersFetch: $_page');

    final Result<List<Character>> result = await _characterRepository.fetchCharacters(_page);
    switch (result) {
      case Success(value: final value):
        _page += 1;
        emit(CharactersLoaded(characters: value));
      case Failure(error: final error):
        emit(CharactersError(message: error.toString()));
    }
    event.completer?.complete();
  }
}
