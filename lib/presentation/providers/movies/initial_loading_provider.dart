import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

part "initial_loading_provider.g.dart";

@riverpod
bool initialLoading(InitialLoadingRef ref) {
  final nowPlayingCallback = ref.watch(moviesRepositoryProvider).getNowPlaying;
  final popularCallback = ref.watch(moviesRepositoryProvider).getPopular;
  final upcomingCallback = ref.watch(moviesRepositoryProvider).getUpcoming;
  final topRatedCallback = ref.watch(moviesRepositoryProvider).getTopRated;
  final step1 = ref.watch(moviesNotifierProvider(nowPlayingCallback)).isEmpty;
  final step2 = ref.watch(moviesNotifierProvider(popularCallback)).isEmpty;
  final step3 = ref.watch(moviesNotifierProvider(upcomingCallback)).isEmpty;
  final step4 = ref.watch(moviesNotifierProvider(topRatedCallback)).isEmpty;

  if (step1 || step2 || step3 || step4) return true;
  return false;
}
