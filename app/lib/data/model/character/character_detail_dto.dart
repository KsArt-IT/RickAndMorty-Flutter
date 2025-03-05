import 'package:rick_and_morty/data/model/models.dart';
import 'package:rick_and_morty/domain/entity/character_detail.dart';

final class CharacterDetailDto {
  final int id;
  final String name;
  final String image;
  final String created;
  final List<String> episode;
  final String gender;
  final CharacterLocationDto location;
  final CharacterOriginDto origin;
  final String species;
  final String status;
  final String type;
  final String url;

  CharacterDetailDto({
    required this.id,
    required this.name,
    required this.image,
    required this.created,
    required this.episode,
    required this.gender,
    required this.location,
    required this.origin,
    required this.species,
    required this.status,
    required this.type,
    required this.url,
  });

  factory CharacterDetailDto.fromJson(data) => CharacterDetailDto(
    id: data['id'],
    name: data['name'],
    image: data['image'],
    created: data['created'],
    episode: (data['episode'] as List<dynamic>).cast<String>(),
    gender: data['gender'],
    location: CharacterLocationDto.fromJson(data['location']),
    origin: CharacterOriginDto.fromJson(data['origin']),
    species: data['species'],
    status: data['status'],
    type: data['type'],
    url: data['url'],
  );

  CharacterDetail toEntity() {
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
