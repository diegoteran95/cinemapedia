import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
part "actors_repository_provider.g.dart";

@riverpod
ActorRepositoryImpl actorsRepository(ActorsRepositoryRef ref) {
  return ActorRepositoryImpl(ActorMoviedbDatasource());
}
