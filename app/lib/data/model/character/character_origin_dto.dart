final class CharacterOriginDto {
  final String name;
  final String url;

  CharacterOriginDto({required this.name, required this.url});

  factory CharacterOriginDto.fromJson(Map<String, dynamic> data) => CharacterOriginDto(
    name: data['name'],
    url: data['url'],
  );
}
