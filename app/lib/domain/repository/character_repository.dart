import 'package:rick_and_morty/domain/entity/entity.dart';
import 'package:rick_and_morty/domain/entity/result.dart';

abstract interface class CharacterRepository {
  Future<Result<List<Character>>> fetchCharacters(int page);
  Future<Result<CharacterDetail>> fetchCharacterDetail(int id);
}
