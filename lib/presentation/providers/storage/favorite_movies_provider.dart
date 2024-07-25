import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
part "favorite_movies_provider.g.dart";

@Riverpod(keepAlive: true)
class StorageMoviesNotifier extends _$StorageMoviesNotifier {
  int page = 0;
  @override
  Map<int, Movie> build(LocalStorageRepository localRepository) {
    return {};
  }

  Future<List<Movie>> loadNextPage() async {
    final movies = await localRepository.loadMovies(offset: page * 10);
    page++;
    final tempMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }
    state = {...state, ...tempMoviesMap};
    return movies;
  }
}
