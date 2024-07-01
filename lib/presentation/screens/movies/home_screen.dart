import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _HomeView()),
      bottomNavigationBar: const CustomBottomNavigation(),
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
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies =
        ref.watch(moviesNotifierProvider(nowPlayingCallback));
    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: slideShowMovies),
            MovieHorizontalList(
              movies: nowPlayingMovies,
              title: "En cines",
              subtitle: "Lunes 20",
              loadNextPage: () => ref
                  .read(moviesNotifierProvider(nowPlayingCallback).notifier)
                  .loadNextPage(),
            ),
            MovieHorizontalList(
              movies: nowPlayingMovies,
              title: "Proximamente",
              subtitle: "En este mes",
              loadNextPage: () => ref
                  .read(moviesNotifierProvider(nowPlayingCallback).notifier)
                  .loadNextPage(),
            ),
            MovieHorizontalList(
              movies: nowPlayingMovies,
              title: "Populares",
              loadNextPage: () => ref
                  .read(moviesNotifierProvider(nowPlayingCallback).notifier)
                  .loadNextPage(),
            ),
            MovieHorizontalList(
              movies: nowPlayingMovies,
              title: "Mejor calificadas",
              subtitle: "Desde siempre",
              loadNextPage: () => ref
                  .read(moviesNotifierProvider(nowPlayingCallback).notifier)
                  .loadNextPage(),
            ),
            const SizedBox(
              height: 50,
            ) // Da un scroll extra al final
            // Expanded( // Expanded para que se adapte al padre
            //   child: ListView.builder(
            //     itemCount: nowPlayingMovies.length,
            //     itemBuilder: (context, index) {
            //       final movie = nowPlayingMovies[index];
            //       return ListTile(title: Text(movie.title));
            //     },
            //   ),
            // )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
