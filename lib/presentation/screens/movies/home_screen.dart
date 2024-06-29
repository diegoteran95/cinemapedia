import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _HomeView()),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  late final MovieCallback nowPlayingCallback;
  @override
  void initState() {
    super.initState();
    nowPlayingCallback = ref.read(moviesRepositoryProvider).getNowPlaying;
    ref
        .read(moviesNotifierProvider(nowPlayingCallback).notifier)
        .loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    print("entra");
    final nowPlayingMovies =
        ref.watch(moviesNotifierProvider(nowPlayingCallback));
    return ListView.builder(
      itemCount: nowPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        return ListTile(title: Text(movie.title));
      },
    );
  }
}