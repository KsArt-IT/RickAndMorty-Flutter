import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/domain/entity/character_detail.dart';
import 'package:rick_and_morty/domain/entity/result.dart';
import 'package:rick_and_morty/domain/repository/character_repository.dart';

part 'character_detail_event.dart';
part 'character_detail_state.dart';

final class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final CharacterRepository _characterRepository;

  CharacterDetailBloc({required CharacterRepository characterRepository})
    : _characterRepository = characterRepository,
      super(CharacterDetailLoading()) {
    on<CharacterDetailFetch>(_onCharacterDetailFetch);
  }

  void _onCharacterDetailFetch(
    CharacterDetailFetch event,
    Emitter<CharacterDetailState> emit,
  ) async {
    try {
      emit(CharacterDetailLoading());
      final result = await _characterRepository.fetchCharacterDetail(event.id);

      switch (result) {
        case Success(value: final value):
          emit(CharacterDetailLoaded(character: value));
        case Failure(error: final error):
          emit(CharacterDetailError(message: error.toString()));
      }
    } catch (e) {
      emit(CharacterDetailError(message: e.toString()));
    }
  }
}
