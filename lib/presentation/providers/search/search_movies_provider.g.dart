// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchQueryHash() => r'355151d4b6c646dcbbfa984e84a9ef8c417a8a6f';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider = NotifierProvider<SearchQuery, String>.internal(
  SearchQuery.new,
  name: r'searchQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchQuery = Notifier<String>;
String _$searchedMoviesNotifierHash() =>
    r'000128562ff2ea137c6c368f171d608ebfca4cf9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SearchedMoviesNotifier extends BuildlessNotifier<List<Movie>> {
  late final Future<List<Movie>> Function(String) searchMovies;

  List<Movie> build(
    Future<List<Movie>> Function(String) searchMovies,
  );
}

/// See also [SearchedMoviesNotifier].
@ProviderFor(SearchedMoviesNotifier)
const searchedMoviesNotifierProvider = SearchedMoviesNotifierFamily();

/// See also [SearchedMoviesNotifier].
class SearchedMoviesNotifierFamily extends Family<List<Movie>> {
  /// See also [SearchedMoviesNotifier].
  const SearchedMoviesNotifierFamily();

  /// See also [SearchedMoviesNotifier].
  SearchedMoviesNotifierProvider call(
    Future<List<Movie>> Function(String) searchMovies,
  ) {
    return SearchedMoviesNotifierProvider(
      searchMovies,
    );
  }

  @override
  SearchedMoviesNotifierProvider getProviderOverride(
    covariant SearchedMoviesNotifierProvider provider,
  ) {
    return call(
      provider.searchMovies,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchedMoviesNotifierProvider';
}

/// See also [SearchedMoviesNotifier].
class SearchedMoviesNotifierProvider
    extends NotifierProviderImpl<SearchedMoviesNotifier, List<Movie>> {
  /// See also [SearchedMoviesNotifier].
  SearchedMoviesNotifierProvider(
    Future<List<Movie>> Function(String) searchMovies,
  ) : this._internal(
          () => SearchedMoviesNotifier()..searchMovies = searchMovies,
          from: searchedMoviesNotifierProvider,
          name: r'searchedMoviesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchedMoviesNotifierHash,
          dependencies: SearchedMoviesNotifierFamily._dependencies,
          allTransitiveDependencies:
              SearchedMoviesNotifierFamily._allTransitiveDependencies,
          searchMovies: searchMovies,
        );

  SearchedMoviesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchMovies,
  }) : super.internal();

  final Future<List<Movie>> Function(String) searchMovies;

  @override
  List<Movie> runNotifierBuild(
    covariant SearchedMoviesNotifier notifier,
  ) {
    return notifier.build(
      searchMovies,
    );
  }

  @override
  Override overrideWith(SearchedMoviesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SearchedMoviesNotifierProvider._internal(
        () => create()..searchMovies = searchMovies,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchMovies: searchMovies,
      ),
    );
  }

  @override
  NotifierProviderElement<SearchedMoviesNotifier, List<Movie>> createElement() {
    return _SearchedMoviesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchedMoviesNotifierProvider &&
        other.searchMovies == searchMovies;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchMovies.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchedMoviesNotifierRef on NotifierProviderRef<List<Movie>> {
  /// The parameter `searchMovies` of this provider.
  Future<List<Movie>> Function(String) get searchMovies;
}

class _SearchedMoviesNotifierProviderElement
    extends NotifierProviderElement<SearchedMoviesNotifier, List<Movie>>
    with SearchedMoviesNotifierRef {
  _SearchedMoviesNotifierProviderElement(super.provider);

  @override
  Future<List<Movie>> Function(String) get searchMovies =>
      (origin as SearchedMoviesNotifierProvider).searchMovies;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
