import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/di/service_locator.dart';
import 'package:rick_and_morty/domain/entity.dart';
import 'package:rick_and_morty/ui/characters/bloc/characters_bloc.dart';
import 'package:rick_and_morty/ui/characters/widgets/character_list_item.dart';
import 'package:rick_and_morty/ui/router/router.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key, required this.title});

  final String title;

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late final CharactersBloc _stateBloc;

  @override
  void initState() {
    super.initState();
    _stateBloc = getIt<CharactersBloc>()..add(CharactersFetch());
  }

  @override
  void dispose() {
    _stateBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer<void>();
          _stateBloc.add(CharactersFetch(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CharactersBloc, CharactersState>(
          bloc: _stateBloc,
          builder:
              (context, state) => switch (state) {
                CharactersLoaded(:final characters, :final hasReachedEnd, :final isLoadingMore) => _buildList(
                  characters,
                  hasReachedEnd,
                  isLoadingMore,
                ),
                CharactersError(:final message) => _buildErrorMessage(message),
                CharactersInitial() => _buildLoadingIndicator(),
              },
        ),
      ),
    );
  }

  Widget _buildList(List<Character> characters, bool hasReachedEnd, bool isLoadingMore) {
    debugPrint("_buildList: characters=${characters.length} hasReachedEnd=$hasReachedEnd isLoadingMore=$isLoadingMore");
    return ListView.builder(
      itemCount: hasReachedEnd ? characters.length : characters.length + 1,
      itemBuilder: (context, index) {
        if (index >= characters.length) {
          if (!isLoadingMore) {
            Future.microtask(() {
              debugPrint("_buildList: CharactersFetchMore");
              _stateBloc.add(CharactersFetch());
            });
          }
          return _buildLoadingIndicator();
        }
        return CharacterListItem(
          character: characters[index],
          onTap: () => AppRoute.navigateTo(context, AppRoute.characterDetail, id: characters[index].id),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(padding: EdgeInsets.all(16.0), child: Center(child: CircularProgressIndicator()));
  }

  Widget _buildErrorMessage(String message) {
    return Center(child: Text(message));
  }
}
