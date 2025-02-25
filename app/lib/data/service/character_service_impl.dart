import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/model/character/character_response.dart';
import 'package:rick_and_morty/data/model/models.dart';
import 'package:rick_and_morty/data/service/charecter_service.dart';
import 'package:rick_and_morty/domain/entity/result.dart';

final class CharacterServiceImpl implements CharacterService {
  static const _baseUrl = 'https://rickandmortyapi.com/api';
  Dio? _dio;
  Dio get dio => _dio ??= Dio(BaseOptions(baseUrl: _baseUrl));

  @override
  Future<Result<List<CharacterDto>>> fetchCharacters(int page) async {
    final response = await dio.get('/character/?page=$page');
    if (response.data != null) {
      final data = CharacterResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return Result.success(data.results);
      } else {
        return Result.failure(Exception('Failed to load characters: ${data.error}'));
      }
    } else {
      return Result.failure(Exception('Failed to load characters'));
    }
  }

  @override
  Future<Result<CharacterDetailDto>> fetchCharacterDetail(int id) async {
    final response = await dio.get('/character/$id');
    if (response.statusCode == 200) {
      return Result.success(CharacterDetailDto.fromJson(response.data));
    } else {
      return Result.failure(Exception('Failed to load character detail'));
    }
  }
}
