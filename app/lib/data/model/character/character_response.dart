import 'package:rick_and_morty/data/models.dart';
import 'package:rick_and_morty/data/model/character/info.dart';

final class CharacterResponse {
  final String? error;
  final Info info;
  final List<CharacterDto> results;

  CharacterResponse({
    required this.error,
    required this.info,
    required this.results,
  });

  factory CharacterResponse.fromJson(data) => CharacterResponse(
    error: data['error'],
    info: Info.fromJson(data['info']),
    results:
        (data['results'] as List<dynamic>)
            .map((e) => CharacterDto.fromJson(e))
            .cast<CharacterDto>()
            .toList(),
  );
}
