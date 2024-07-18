import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
part "search_movies_provider.g.dart";

@Riverpod(keepAlive: true)
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return "";
  }

  updateQuery(String query) {
    state = query;
  }
}

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

@Riverpod(keepAlive: true)
class SearchedMoviesNotifier extends _$SearchedMoviesNotifier {
  @override
  List<Movie> build(SearchMoviesCallback searchMovies) {
    return [];
  }

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).updateQuery(query);
    state = movies;
    return movies;
  }
}
