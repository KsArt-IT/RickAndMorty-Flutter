import 'package:rick_and_morty/data/models.dart';
import 'package:rick_and_morty/domain/entity.dart';

extension CharacterToDomain on CharacterDto {
  Character toDomain() {
    return Character(
      id: id,
      name: name,
      status: status.toCharacterStatus(),
      species: species.toCharacterSpecies(),
      type: type,
      gender: gender.toCharacterGender(),
      locationName: location.name,
      locationUrl: location.url,
      image: image,
      url: url,
      created: created,
    );
  }
}

extension CharacterDetailToDomain on CharacterDetailDto {
  CharacterDetail toDomain() {
    return CharacterDetail(
      id: id,
      name: name,
      image: image,
      created: created,
      episode: episode,
      gender: gender,
      locationName: location.name,
      locationUrl: location.url,
      originName: origin.name,
      originUrl: origin.url,
      species: species,
      status: status,
      type: type,
      url: url,
    );
  }
}

extension _CharacterParamsToDomain on String {
  CharacterStatus toCharacterStatus() {
    return switch (this) {
      'Alive' => CharacterStatus.alive,
      'Dead' => CharacterStatus.dead,
      _ => CharacterStatus.unknown,
    };
  }

  CharacterSpecies toCharacterSpecies() {
    return switch (this) {
      'Human' => CharacterSpecies.human,
      'Alien' => CharacterSpecies.alien,
      'unknown' => CharacterSpecies.unknown,
      _ => CharacterSpecies.other,
    };
  }

  CharacterGender toCharacterGender() {
    return switch (this) {
      'Male' => CharacterGender.male,
      'unknown' => CharacterGender.female,
      'Genderless' => CharacterGender.genderless,
      _ => CharacterGender.unknown,
    };
  }
}