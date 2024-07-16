import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class MovieScreen extends ConsumerStatefulWidget {
  static const String name = "movie-info";
  final String movieId;

  const MovieScreen({super.key, required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  late final GetMovieCallback getMovieCallback;

  @override
  void initState() {
    super.initState();
    getMovieCallback = ref.read(moviesRepositoryProvider).getMovieById;
    ref
        .read(movieMapNotifierProvider(getMovieCallback).notifier)
        .loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie =
        ref.watch(movieMapNotifierProvider(getMovieCallback))[widget.movieId];
    if (movie == null) {
      return const Scaffold(
          body: Center(child: CircularProgressIndicator(strokeWidth: 2)));
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomSliverAppbar(movie: movie),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _MovieDetails(
                        movie: movie,
                      ),
                  childCount: 1)),
        ],
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}

class _MovieDetails extends StatelessWidget {
  final Movie movie;

  const _MovieDetails({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width * 0.3,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: (size.width - 40) * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: textStyles.titleLarge,
                    ),
                    Text(movie.overview)
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((gender) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Chip(
                      label: Text(gender),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ))
            ],
          ),
        ),
        _ActorsByMovie(movieId: movie.id),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

class _CustomSliverAppbar extends StatelessWidget {
  final Movie movie;
  const _CustomSliverAppbar({required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const SizedBox();
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment
                              .topCenter, // desde donde empieza el gradiente
                          end: Alignment
                              .bottomCenter, // donde termina el gradiente
                          stops: [
                    0.7,
                    1.0
                  ], // En que parte de la pantalla empieza y termina
                          colors: [
                    Colors.transparent,
                    Colors.black87
                  ]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment
                              .topLeft, // desde donde empieza el gradiente/ donde termina el gradiente
                          stops: [0.0, 0.4],
                          colors: [Colors.black87, Colors.transparent]))),
            )
          ],
        ),
      ),
    );
  }
}

class _ActorsByMovie extends ConsumerStatefulWidget {
  final int movieId;
  const _ActorsByMovie({required this.movieId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActorsByMovieState();
}

class _ActorsByMovieState extends ConsumerState<_ActorsByMovie> {
  late final GetActorsCallback getActorsCallback;

  @override
  void initState() {
    super.initState();
    getActorsCallback = ref.read(actorsRepositoryProvider).getActorsByMovie;
    ref
        .read(actorsMapNotifierProvider(getActorsCallback).notifier)
        .loadActors(widget.movieId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final actorsByMovie =
        ref.watch(actorsMapNotifierProvider(getActorsCallback));
    if (actorsByMovie[widget.movieId.toString()] == null) {
      return const CircularProgressIndicator(
        strokeWidth: 2,
      );
    }
    final actors = actorsByMovie[widget.movieId.toString()]!;
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return Container(
            padding: const EdgeInsets.all(8),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      actor.profilePath,
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  actor.name,
                  maxLines: 2,
                ),
                Text(
                  actor.character ?? "",
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}