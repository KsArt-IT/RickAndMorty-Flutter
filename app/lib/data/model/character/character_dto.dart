import 'package:rick_and_morty/data/model/models.dart';
import 'package:rick_and_morty/domain/entity/character.dart';

final class CharacterDto {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocationDto location;
  final String image;
  final String url;
  final String created;

  CharacterDto({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.location,
    required this.image,
    required this.url,
    required this.created,
  });

  static CharacterDto fromJson(e) {
    return CharacterDto(
      id: e['id'],
      name: e['name'],
      status: e['status'],
      species: e['species'],
      type: e['type'],
      gender: e['gender'],
      location: CharacterLocationDto.fromJson(e['location']),
      image: e['image'],
      url: e['url'],
      created: e['created'],
    );
  }

  Character toEntity() {
    return Character(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      locationName: location.name,
      locationUrl: location.url,
      image: image,
      url: url,
      created: created,
    );
  }
}