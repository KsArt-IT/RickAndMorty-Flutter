import 'package:equatable/equatable.dart';

final class CharacterDetail extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String locationName;
  final String locationUrl;
  final String originName;
  final String originUrl;
  final String image;
  final String url;
  final String created;
  final List<String> episode;

  const CharacterDetail({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.locationName,
    required this.locationUrl,
    required this.originName,
    required this.originUrl,
    required this.image,
    required this.url,
    required this.created,
    required this.episode,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    type,
    locationName,
  ];
}
