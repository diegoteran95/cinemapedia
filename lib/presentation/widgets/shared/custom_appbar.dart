import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity, // Toma todo el ancho disponible
            child: Row(
              children: [
                Icon(
                  Icons.movie_outlined,
                  color: colors.primary,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Cinemapedia",
                  style: titleStyle,
                ),
                const Spacer(), // Toma todo el espacio disponible entre widgets
                IconButton(
                    onPressed: () {
                      final movieRepositorySearch =
                          ref.read(moviesRepositoryProvider).searchMovies;
                      final searchQuery = ref.read(searchQueryProvider);
                      final movies = ref.watch(searchedMoviesNotifierProvider(
                          movieRepositorySearch));
                      showSearch<Movie?>(
                              query: searchQuery,
                              context: context,
                              delegate: SearchMovieDelegate(
                                  initialMovies: movies,
                                  searchMovies: ref
                                      .read(searchedMoviesNotifierProvider(
                                              movieRepositorySearch)
                                          .notifier)
                                      .searchMoviesByQuery))
                          .then((movie) {
                        if (movie == null) return;
                        context.push("/movie/${movie.id}");
                      });
                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
