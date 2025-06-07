import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/domain/entity.dart';

final class Character extends Equatable {
  final int id;
  final String name;
  final CharacterStatus status;
  final CharacterSpecies species;
  final String type;
  final CharacterGender gender;
  final String locationName;
  final String locationUrl;
  final String image;
  final String url;
  final String created;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.locationName,
    required this.locationUrl,
    required this.image,
    required this.url,
    required this.created,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    locationName,
  ];
}
