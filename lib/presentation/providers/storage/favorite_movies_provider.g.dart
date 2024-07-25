// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storageMoviesNotifierHash() =>
    r'69e81d61bffe9e4691a32d8e6eadcf980e87376d';

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

abstract class _$StorageMoviesNotifier
    extends BuildlessNotifier<Map<int, Movie>> {
  late final LocalStorageRepository localRepository;

  Map<int, Movie> build(
    LocalStorageRepository localRepository,
  );
}

/// See also [StorageMoviesNotifier].
@ProviderFor(StorageMoviesNotifier)
const storageMoviesNotifierProvider = StorageMoviesNotifierFamily();

/// See also [StorageMoviesNotifier].
class StorageMoviesNotifierFamily extends Family<Map<int, Movie>> {
  /// See also [StorageMoviesNotifier].
  const StorageMoviesNotifierFamily();

  /// See also [StorageMoviesNotifier].
  StorageMoviesNotifierProvider call(
    LocalStorageRepository localRepository,
  ) {
    return StorageMoviesNotifierProvider(
      localRepository,
    );
  }

  @override
  StorageMoviesNotifierProvider getProviderOverride(
    covariant StorageMoviesNotifierProvider provider,
  ) {
    return call(
      provider.localRepository,
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
  String? get name => r'storageMoviesNotifierProvider';
}

/// See also [StorageMoviesNotifier].
class StorageMoviesNotifierProvider
    extends NotifierProviderImpl<StorageMoviesNotifier, Map<int, Movie>> {
  /// See also [StorageMoviesNotifier].
  StorageMoviesNotifierProvider(
    LocalStorageRepository localRepository,
  ) : this._internal(
          () => StorageMoviesNotifier()..localRepository = localRepository,
          from: storageMoviesNotifierProvider,
          name: r'storageMoviesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storageMoviesNotifierHash,
          dependencies: StorageMoviesNotifierFamily._dependencies,
          allTransitiveDependencies:
              StorageMoviesNotifierFamily._allTransitiveDependencies,
          localRepository: localRepository,
        );

  StorageMoviesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.localRepository,
  }) : super.internal();

  final LocalStorageRepository localRepository;

  @override
  Map<int, Movie> runNotifierBuild(
    covariant StorageMoviesNotifier notifier,
  ) {
    return notifier.build(
      localRepository,
    );
  }

  @override
  Override overrideWith(StorageMoviesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: StorageMoviesNotifierProvider._internal(
        () => create()..localRepository = localRepository,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        localRepository: localRepository,
      ),
    );
  }

  @override
  NotifierProviderElement<StorageMoviesNotifier, Map<int, Movie>>
      createElement() {
    return _StorageMoviesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StorageMoviesNotifierProvider &&
        other.localRepository == localRepository;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, localRepository.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StorageMoviesNotifierRef on NotifierProviderRef<Map<int, Movie>> {
  /// The parameter `localRepository` of this provider.
  LocalStorageRepository get localRepository;
}

class _StorageMoviesNotifierProviderElement
    extends NotifierProviderElement<StorageMoviesNotifier, Map<int, Movie>>
    with StorageMoviesNotifierRef {
  _StorageMoviesNotifierProviderElement(super.provider);

  @override
  LocalStorageRepository get localRepository =>
      (origin as StorageMoviesNotifierProvider).localRepository;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
