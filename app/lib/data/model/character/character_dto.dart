import 'package:rick_and_morty/data/models.dart';

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

  factory CharacterDto.fromJson(Map<String, dynamic> data) => CharacterDto(
    id: data['id'],
    name: data['name'],
    status: data['status'],
    species: data['species'],
    type: data['type'],
    gender: data['gender'],
    location: CharacterLocationDto.fromJson(data['location']),
    image: data['image'],
    url: data['url'],
    created: data['created'],
  );
}
