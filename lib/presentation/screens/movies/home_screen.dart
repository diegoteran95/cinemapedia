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
  late final MovieCallback popularCallback;
  late final MovieCallback upcomingCallback;
  late final MovieCallback topRatedCallback;
  late final GetActorsCallback getActorsCallback;

  @override
  void initState() {
    super.initState();
    nowPlayingCallback = ref.read(moviesRepositoryProvider).getNowPlaying;
    popularCallback = ref.read(moviesRepositoryProvider).getPopular;
    upcomingCallback = ref.read(moviesRepositoryProvider).getUpcoming;
    topRatedCallback = ref.read(moviesRepositoryProvider).getTopRated;
    getActorsCallback = ref.read(actorsRepositoryProvider).getActorsByMovie;

    ref
        .read(moviesNotifierProvider(nowPlayingCallback).notifier)
        .loadNextPage();
    ref.read(moviesNotifierProvider(popularCallback).notifier).loadNextPage();
    ref.read(moviesNotifierProvider(upcomingCallback).notifier).loadNextPage();
    ref.read(moviesNotifierProvider(topRatedCallback).notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies =
        ref.watch(moviesNotifierProvider(nowPlayingCallback));
    final popularMovies = ref.watch(moviesNotifierProvider(popularCallback));
    final upcomingMovies = ref.watch(moviesNotifierProvider(upcomingCallback));
    final topRatedMovies = ref.watch(moviesNotifierProvider(topRatedCallback));

    return Visibility(
      // Este widget sirve para ocultar en base a una condicion hasta que se cargue el widget
      visible: !initialLoading,
      child: CustomScrollView(slivers: [
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
                movies: popularMovies,
                title: "Populares",
                loadNextPage: () => ref
                    .read(moviesNotifierProvider(popularCallback).notifier)
                    .loadNextPage(),
              ),
              MovieHorizontalList(
                movies: upcomingMovies,
                title: "Proximamente",
                subtitle: "En este mes",
                loadNextPage: () => ref
                    .read(moviesNotifierProvider(upcomingCallback).notifier)
                    .loadNextPage(),
              ),
              MovieHorizontalList(
                movies: topRatedMovies,
                title: "Mejor calificadas",
                subtitle: "Desde siempre",
                loadNextPage: () => ref
                    .read(moviesNotifierProvider(topRatedCallback).notifier)
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
      ]),
    );
  }
}
