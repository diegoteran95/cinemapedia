import "package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:cinemapedia/domain/entities/movie.dart";

part "movies_providers.g.dart";

typedef MovieCallback = Future<List<Movie>> Function({int page});

@riverpod
class MoviesNotifier extends _$MoviesNotifier {
  int currentPage = 0;

  @override
  List<Movie> build(MovieCallback fetchMoreMovies) {
    return [];
  }

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
