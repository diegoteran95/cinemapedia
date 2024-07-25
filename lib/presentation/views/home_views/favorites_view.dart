import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class FavoritesView extends ConsumerStatefulWidget {
  static const String name = "favorites";

  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  late LocalStorageRepository localStorageRep;
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    localStorageRep = ref.read(localStorageRepositoryProvider);
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies = await ref
        .read(storageMoviesNotifierProvider(localStorageRep).notifier)
        .loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref
        .watch(storageMoviesNotifierProvider(localStorageRep))
        .values
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites View"),
      ),
      body: MovieMasonry(
        movies: movies,
        loadNextPage: loadNextPage,
      ),
    );
  }
}
