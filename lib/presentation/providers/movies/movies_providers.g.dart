// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesNotifierHash() => r'c8f69dc4a8f34866ae02eac7270ea3fe28faa63f';

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

abstract class _$MoviesNotifier
    extends BuildlessAutoDisposeNotifier<List<Movie>> {
  late final Future<List<Movie>> Function({int page}) fetchMoreMovies;

  List<Movie> build(
    Future<List<Movie>> Function({int page}) fetchMoreMovies,
  );
}

/// See also [MoviesNotifier].
@ProviderFor(MoviesNotifier)
const moviesNotifierProvider = MoviesNotifierFamily();

/// See also [MoviesNotifier].
class MoviesNotifierFamily extends Family<List<Movie>> {
  /// See also [MoviesNotifier].
  const MoviesNotifierFamily();

  /// See also [MoviesNotifier].
  MoviesNotifierProvider call(
    Future<List<Movie>> Function({int page}) fetchMoreMovies,
  ) {
    return MoviesNotifierProvider(
      fetchMoreMovies,
    );
  }

  @override
  MoviesNotifierProvider getProviderOverride(
    covariant MoviesNotifierProvider provider,
  ) {
    return call(
      provider.fetchMoreMovies,
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
  String? get name => r'moviesNotifierProvider';
}

/// See also [MoviesNotifier].
class MoviesNotifierProvider
    extends AutoDisposeNotifierProviderImpl<MoviesNotifier, List<Movie>> {
  /// See also [MoviesNotifier].
  MoviesNotifierProvider(
    Future<List<Movie>> Function({int page}) fetchMoreMovies,
  ) : this._internal(
          () => MoviesNotifier()..fetchMoreMovies = fetchMoreMovies,
          from: moviesNotifierProvider,
          name: r'moviesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moviesNotifierHash,
          dependencies: MoviesNotifierFamily._dependencies,
          allTransitiveDependencies:
              MoviesNotifierFamily._allTransitiveDependencies,
          fetchMoreMovies: fetchMoreMovies,
        );

  MoviesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fetchMoreMovies,
  }) : super.internal();

  final Future<List<Movie>> Function({int page}) fetchMoreMovies;

  @override
  List<Movie> runNotifierBuild(
    covariant MoviesNotifier notifier,
  ) {
    return notifier.build(
      fetchMoreMovies,
    );
  }

  @override
  Override overrideWith(MoviesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MoviesNotifierProvider._internal(
        () => create()..fetchMoreMovies = fetchMoreMovies,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fetchMoreMovies: fetchMoreMovies,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<MoviesNotifier, List<Movie>>
      createElement() {
    return _MoviesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MoviesNotifierProvider &&
        other.fetchMoreMovies == fetchMoreMovies;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fetchMoreMovies.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MoviesNotifierRef on AutoDisposeNotifierProviderRef<List<Movie>> {
  /// The parameter `fetchMoreMovies` of this provider.
  Future<List<Movie>> Function({int page}) get fetchMoreMovies;
}

class _MoviesNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<MoviesNotifier, List<Movie>>
    with MoviesNotifierRef {
  _MoviesNotifierProviderElement(super.provider);

  @override
  Future<List<Movie>> Function({int page}) get fetchMoreMovies =>
      (origin as MoviesNotifierProvider).fetchMoreMovies;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
