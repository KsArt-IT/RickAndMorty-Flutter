import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/character/character_response.dart';
import 'package:rick_and_morty/data/models.dart';
import 'package:rick_and_morty/data/service/charecter_service.dart';
import 'package:rick_and_morty/domain/entity/result.dart';

final class CharacterServiceImpl implements CharacterService {
  static const _baseUrl = 'https://rickandmortyapi.com/api';
  Dio? _dio;

  Dio get dio => _dio ??= Dio(BaseOptions(baseUrl: _baseUrl));

  @override
  Future<Result<List<CharacterDto>>> fetchCharacters(int page) async {
    debugPrint('CharacterServiceImpl::fetchCharacters: $page');
    try {
      final response = await _executeRequest('/character/?page=$page');
      return _parseResponse<List<CharacterDto>>(
        response: response,
        fromJson: (json) => CharacterResponse.fromJson(json).results,
        errorPrefix: 'Failed to load characters',
      );
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  @override
  Future<Result<CharacterDetailDto>> fetchCharacterDetail(int id) async {
    debugPrint('CharacterServiceImpl::fetchCharacterDetail: id=$id');
    try {
      final response = await _executeRequest('/character/$id');
      return _parseResponse<CharacterDetailDto>(
        response: response,
        fromJson: CharacterDetailDto.fromJson,
        errorPrefix: 'Failed to load character detail',
      );
    } catch (e) {
      return Result.failure(Exception(e.toString()));
    }
  }

  Future<Response<T>> _executeRequest<T>(String path) async {
    try {
      return await dio.get<T>(path);
    } catch (e) {
      debugPrint('CharacterServiceImpl::_executeRequest: network error=$e');
      throw Exception('Network error while loading data: $e');
    }
  }

  Result<T> _parseResponse<T>({
    required Response response,
    required T Function(Map<String, dynamic>) fromJson,
    required String errorPrefix,
  }) {
    final errorMessage = _checkStatusError(response: response);
    if (errorMessage != null) {
      return Result.failure(Exception('$errorPrefix: $errorMessage'));
    }
    try {
      debugPrint('CharacterServiceImpl::_parseResponse: ${response.data}');
      final result = fromJson(response.data);
      debugPrint('CharacterServiceImpl::_parseResponse: Ok');
      return Result.success(result);
    } catch (e) {
      debugPrint(
        'CharacterServiceImpl::_parseResponse: JSON parsing error: $e',
      );
      return Result.failure(Exception('Failed to parse data: $e'));
    }
  }

  String? _checkStatusError({required Response response}) {
    if (response.statusCode != 200) {
      debugPrint(
        'CharacterServiceImpl::_parseResponse: Error status code: ${response.statusCode}',
      );
      return 'Server returned ${response.statusCode}';
    }

    if (response.data == null) {
      debugPrint('CharacterServiceImpl::_parseResponse: response data is null');
      return 'No data received';
    }
    return null;
  }
}
