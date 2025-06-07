enum CharacterStatus {
  alive("Alive"),
  dead("Dead"),
  unknown("unknown");

  const CharacterStatus(this.value);
  final String value;
}
