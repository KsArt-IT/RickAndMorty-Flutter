import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/character_detail/character_detail_screen.dart';
import 'package:rick_and_morty/ui/characters/characters_screen.dart';

enum AppRoute {
  characters("/characters_list"),
  characterDetail("/characters_detail");

  final String route;

  const AppRoute(this.route);

  static void navigateTo(
    BuildContext context,
    AppRoute appRoute, {
    int? id,
  }) {
    if (id != null) {
      Navigator.of(context).pushNamed(appRoute.route, arguments: id);
    } else {
      Navigator.of(context).pushNamed(appRoute.route);
    }
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoute.characters.route: (context) => const CharactersScreen(title: 'Rick and Morty'),
      AppRoute.characterDetail.route: (context) => CharacterDetailScreen(),
    };
  }
}
