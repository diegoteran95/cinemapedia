// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieMapNotifierHash() => r'7596bbeb4c2d6f3934b98a4da3c6becc475da0b8';

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

abstract class _$MovieMapNotifier
    extends BuildlessNotifier<Map<String, Movie>> {
  late final Future<Movie> Function(String) getMovie;

  Map<String, Movie> build(
    Future<Movie> Function(String) getMovie,
  );
}

/// See also [MovieMapNotifier].
@ProviderFor(MovieMapNotifier)
const movieMapNotifierProvider = MovieMapNotifierFamily();

/// See also [MovieMapNotifier].
class MovieMapNotifierFamily extends Family<Map<String, Movie>> {
  /// See also [MovieMapNotifier].
  const MovieMapNotifierFamily();

  /// See also [MovieMapNotifier].
  MovieMapNotifierProvider call(
    Future<Movie> Function(String) getMovie,
  ) {
    return MovieMapNotifierProvider(
      getMovie,
    );
  }

  @override
  MovieMapNotifierProvider getProviderOverride(
    covariant MovieMapNotifierProvider provider,
  ) {
    return call(
      provider.getMovie,
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
  String? get name => r'movieMapNotifierProvider';
}

/// See also [MovieMapNotifier].
class MovieMapNotifierProvider
    extends NotifierProviderImpl<MovieMapNotifier, Map<String, Movie>> {
  /// See also [MovieMapNotifier].
  MovieMapNotifierProvider(
    Future<Movie> Function(String) getMovie,
  ) : this._internal(
          () => MovieMapNotifier()..getMovie = getMovie,
          from: movieMapNotifierProvider,
          name: r'movieMapNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieMapNotifierHash,
          dependencies: MovieMapNotifierFamily._dependencies,
          allTransitiveDependencies:
              MovieMapNotifierFamily._allTransitiveDependencies,
          getMovie: getMovie,
        );

  MovieMapNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.getMovie,
  }) : super.internal();

  final Future<Movie> Function(String) getMovie;

  @override
  Map<String, Movie> runNotifierBuild(
    covariant MovieMapNotifier notifier,
  ) {
    return notifier.build(
      getMovie,
    );
  }

  @override
  Override overrideWith(MovieMapNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieMapNotifierProvider._internal(
        () => create()..getMovie = getMovie,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        getMovie: getMovie,
      ),
    );
  }

  @override
  NotifierProviderElement<MovieMapNotifier, Map<String, Movie>>
      createElement() {
    return _MovieMapNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieMapNotifierProvider && other.getMovie == getMovie;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, getMovie.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MovieMapNotifierRef on NotifierProviderRef<Map<String, Movie>> {
  /// The parameter `getMovie` of this provider.
  Future<Movie> Function(String) get getMovie;
}

class _MovieMapNotifierProviderElement
    extends NotifierProviderElement<MovieMapNotifier, Map<String, Movie>>
    with MovieMapNotifierRef {
  _MovieMapNotifierProviderElement(super.provider);

  @override
  Future<Movie> Function(String) get getMovie =>
      (origin as MovieMapNotifierProvider).getMovie;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
