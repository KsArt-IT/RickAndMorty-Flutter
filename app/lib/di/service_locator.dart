import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/data/repository/character_repository_impl.dart';
import 'package:rick_and_morty/data/service/character_service_impl.dart';
import 'package:rick_and_morty/data/service/charecter_service.dart';
import 'package:rick_and_morty/domain/repository/character_repository.dart';
import 'package:rick_and_morty/ui/character_detail/bloc/character_detail_bloc.dart';
import 'package:rick_and_morty/ui/characters/bloc/characters_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Services
  getIt.registerLazySingleton<CharacterService>(() => CharacterServiceImpl());

  // Repositories
  getIt.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(characterApi: getIt()));

  // BLoCs
  getIt.registerFactory(() => CharactersBloc(characterRepository: getIt()));
  getIt.registerFactory(() => CharacterDetailBloc(characterRepository: getIt()));
}
