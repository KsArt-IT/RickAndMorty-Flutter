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
  bool _hasReachedEnd = false;
  bool _isLoad = false;
  final List<Character> _characters = [];

  CharactersBloc({required CharacterRepository characterRepository})
    : _characterRepository = characterRepository,
      super(CharactersInitial()) {
    on<CharactersFetch>(_onCharactersFetch);
  }

  void _onCharactersFetch(CharactersFetch event, Emitter<CharactersState> emit) async {
    if (_isLoad) return;
    _isLoad = true;

    _hasReachedEnd = false;

    await _fetchCharacters(emit);

    event.completer?.complete();
    _isLoad = false;
  }

  Future<void> _fetchCharacters(Emitter<CharactersState> emit) async {
    debugPrint('CharactersBloc::_fetchCharacters: $_page');

    try {
      if (_characters.isNotEmpty) {
        // Эмитим состояние загрузки с текущими данными
        emit(CharactersLoaded(characters: _characters, hasReachedEnd: _hasReachedEnd, isLoadingMore: true));
      }
      final result = await _characterRepository.fetchCharacters(_page);

      switch (result) {
        case Success(value: final value):
          if (value.isEmpty) {
            _hasReachedEnd = true;
          } else {
            _hasReachedEnd = false;
            _setList(value);
          }

          debugPrint("_fetchCharacters::success: characters=${_characters.length}");
          emit(CharactersLoaded(characters: _characters, hasReachedEnd: _hasReachedEnd, isLoadingMore: false));

        case Failure(error: final error):
          emit(CharactersError(message: error.toString()));
      }
    } catch (e) {
      emit(CharactersError(message: e.toString()));
    }
  }

  void _setList(List<Character> list) {
    _characters.addAll(list);
    _page++;
  }
}
