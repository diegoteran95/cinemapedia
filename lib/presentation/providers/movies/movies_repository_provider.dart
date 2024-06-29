import "package:riverpod_annotation/riverpod_annotation.dart";

import "package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart";
import "package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart";
part "movies_repository_provider.g.dart";

// Este repositorio es inmutable
@riverpod
MovieRepositoryImpl moviesRepository(MoviesRepositoryRef ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
}