import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cinemapedia/infrastructure/datasources/isar_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/local_storage_repository_impl.dart';
part "local_storage_provider.g.dart";

@riverpod
LocalStorageRepositoryImpl localStorageRepository(
    LocalStorageRepositoryRef ref) {
  return LocalStorageRepositoryImpl(datasource: IsarDatasource());
}

@riverpod
Future<bool> isFavorite(IsFavoriteRef ref, {required int movieId}) async {
  final LocalStorageRepositoryImpl localrepositoryProvider =
      ref.watch(localStorageRepositoryProvider);
  return localrepositoryProvider.isMovieFavorite(movieId);
}
