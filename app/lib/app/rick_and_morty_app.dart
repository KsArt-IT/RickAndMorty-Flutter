import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/characters/characters_screen.dart';
import 'package:rick_and_morty/ui/theme/app_theme.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const CharactersScreen(title: 'Rick and Morty'),
    );
  }
}
