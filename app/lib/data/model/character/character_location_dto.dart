final class CharacterLocationDto {
  final String name;
  final String url;

  CharacterLocationDto({required this.name, required this.url});

  static CharacterLocationDto fromJson(data) {
    return CharacterLocationDto(
      name: data['name'],
      url: data['url'],
    );
  }
}
