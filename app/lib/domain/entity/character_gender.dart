enum CharacterGender {
  male("Male"),
  female("Female"),
  genderless("Genderless"),
  unknown("unknown");

  const CharacterGender(this.value);
  final String value;
}
