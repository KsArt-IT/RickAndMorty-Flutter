final class CharacterLocationDto {
  final String name;
  final String url;

  CharacterLocationDto({required this.name, required this.url});

  factory CharacterLocationDto.fromJson(Map<String, dynamic> data) => CharacterLocationDto(
    name: data['name'],
    url: data['url'],
  );
}
