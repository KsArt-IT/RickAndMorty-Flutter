final class CharacterOriginDto {
  final String name;
  final String url;

  CharacterOriginDto({required this.name, required this.url});

  static CharacterOriginDto fromJson(data) {
    return CharacterOriginDto(
      name: data['name'],
      url: data['url'],
    );
  }
}
