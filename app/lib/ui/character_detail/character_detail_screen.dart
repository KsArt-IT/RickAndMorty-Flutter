import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/di/service_locator.dart';
import 'package:rick_and_morty/domain/entity/character_detail.dart';
import 'package:rick_and_morty/ui/character_detail/bloc/character_detail_bloc.dart';
import 'package:rick_and_morty/ui/router/router.dart';
import 'package:rick_and_morty/ui/theme/app_constants.dart';

@immutable
class CharacterDetailScreen extends StatefulWidget {
  String title = "Character Detail";

  CharacterDetailScreen({super.key});
  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreen();
}

class _CharacterDetailScreen extends State<CharacterDetailScreen> {
  late final CharacterDetailBloc _stateBloc;
  late final int _id;

  @override
  void initState() {
    super.initState();
    _stateBloc = getIt<CharacterDetailBloc>();
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args is int, "ID должен быть целым числом");
    _id = args as int;
    super.didChangeDependencies();
    if (_id > 0) {
      debugPrint('CharacterDetailScreen::didChangeDependencies ID: $_id');
      _stateBloc.add(CharacterDetailFetch(id: _id));
    } else {
      AppRoute.goBack(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<CharacterDetailBloc, CharacterDetailState>(
        bloc: _stateBloc,
        builder:
            (context, state) => switch (state) {
              CharacterDetailLoaded(:final character) => _buildCharacter(
                character,
              ),
              CharacterDetailError(:final message) => _buildErrorMessage(
                message,
              ),
              CharacterDetailLoading() => _buildLoadingIndicator(),
            },
      ),
    );
  }

  Widget _buildCharacter(CharacterDetail character) {
    widget.title = character.name;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Dimens.medium),
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: Sizes.borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(Dimens.small),
              margin: const EdgeInsets.only(bottom: Dimens.medium),
              width: Sizes.image,
              height: Sizes.image,
              child: Image.network(character.image, fit: BoxFit.cover),
            ),
            Text(
              character.name,
              style: TextStyle(
                fontSize: Sizes.titleSize,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(character.status),
            Text(character.species),
            Text(character.type),
            Text(character.gender),
            Text(character.locationName),
            Text(character.locationUrl),
            Text(character.originName),
            Text(character.originUrl),
            Text(character.url),
            Text(character.created),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage(String message) {
    return Center(child: Text(message));
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
