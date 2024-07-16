import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
part "movies_slideshow_provider.g.dart";

@riverpod
List<Movie> moviesSlideshow(MoviesSlideshowRef ref) {
  final nowPlayingCallback = ref.watch(moviesRepositoryProvider).getNowPlaying;
  final nowPlayingMovies =
      ref.watch(moviesNotifierProvider(nowPlayingCallback));
  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
}
