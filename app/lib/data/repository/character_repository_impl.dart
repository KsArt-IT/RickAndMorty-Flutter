import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/mappers/dto_to_domain.dart';
import 'package:rick_and_morty/data/service/charecter_service.dart';
import 'package:rick_and_morty/domain/entity.dart';
import 'package:rick_and_morty/domain/entity/result.dart';
import 'package:rick_and_morty/domain/repository/character_repository.dart';

final class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterService characterApi;

  CharacterRepositoryImpl({required this.characterApi});

  @override
  Future<Result<List<Character>>> fetchCharacters(int page) async {
    debugPrint('CharacterRepositoryImpl::fetchCharacters: $page');
    final response = await characterApi.fetchCharacters(page);
    return switch (response) {
      Success(value: final value) => Result.success(
        value.map((e) => e.toDomain()).toList(),
      ),
      Failure(error: final error) => Result.failure(error),
    };
  }

  @override
  Future<Result<CharacterDetail>> fetchCharacterDetail(int id) async {
    final response = await characterApi.fetchCharacterDetail(id);
    return switch (response) {
      Success(value: final value) => Result.success(value.toDomain()),
      Failure(error: final error) => Result.failure(error),
    };
  }
}
