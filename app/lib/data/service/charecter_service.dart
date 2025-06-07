import 'package:rick_and_morty/data/models.dart';
import 'package:rick_and_morty/domain/entity/result.dart';

abstract interface class CharacterService {
  Future<Result<List<CharacterDto>>> fetchCharacters(int page);
  Future<Result<CharacterDetailDto>> fetchCharacterDetail(int id);
}
