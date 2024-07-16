import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

part "movie_info_provider.g.dart";

typedef GetMovieCallback = Future<Movie> Function(String movieId);

@Riverpod(keepAlive: true)
class MovieMapNotifier extends _$MovieMapNotifier {
  @override
  Map<String, Movie> build(GetMovieCallback getMovie) {
    ref.onDispose(() {
      print("borrar movies");
    });
    print("provider movies");
    return {};
  }

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
