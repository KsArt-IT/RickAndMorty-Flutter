import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entity/character.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;
  final Function() onTap;

  const CharacterListItem({super.key, required this.character, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(character.image),
      title: Text(character.name),
      subtitle: Text(character.species),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
