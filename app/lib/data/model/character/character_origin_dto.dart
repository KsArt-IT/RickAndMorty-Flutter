final class CharacterOriginDto {
  final String name;
  final String url;

  CharacterOriginDto({required this.name, required this.url});

  factory CharacterOriginDto.fromJson(data) => CharacterOriginDto(name: data['name'], url: data['url']);
}
