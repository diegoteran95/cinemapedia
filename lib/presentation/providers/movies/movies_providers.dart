import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:cinemapedia/domain/entities/movie.dart";

part "movies_providers.g.dart";

typedef MovieCallback = Future<List<Movie>> Function({int page});

@riverpod
class MoviesNotifier extends _$MoviesNotifier {
  int currentPage = 0;
  bool isLoading = false;

  @override
  List<Movie> build(MovieCallback fetchMoreMovies) {
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    print("loading more movies");
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
