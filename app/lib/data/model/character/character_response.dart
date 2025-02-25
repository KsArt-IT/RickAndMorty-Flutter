import 'package:rick_and_morty/data/model/character/character_dto.dart';
import 'package:rick_and_morty/data/model/character/info.dart';

final class CharacterResponse {
  final String? error;
  final Info info;
  final List<CharacterDto> results;

  CharacterResponse({required this.error, required this.info, required this.results});

  static CharacterResponse fromJson(data) {
    return CharacterResponse(
      error: data['error'],
      info: Info.fromJson(data['info']),
      results: data['results'].map((e) => CharacterDto.fromJson(e)).toList(),
    );
  }
}

