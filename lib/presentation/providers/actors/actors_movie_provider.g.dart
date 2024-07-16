// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actors_movie_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$actorsMapNotifierHash() => r'994617d0117da4c53e823c2ec675d4316931d1d4';

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

abstract class _$ActorsMapNotifier
    extends BuildlessNotifier<Map<String, List<Actor>>> {
  late final Future<List<Actor>> Function(String) getActors;

  Map<String, List<Actor>> build(
    Future<List<Actor>> Function(String) getActors,
  );
}

/// See also [ActorsMapNotifier].
@ProviderFor(ActorsMapNotifier)
const actorsMapNotifierProvider = ActorsMapNotifierFamily();

/// See also [ActorsMapNotifier].
class ActorsMapNotifierFamily extends Family<Map<String, List<Actor>>> {
  /// See also [ActorsMapNotifier].
  const ActorsMapNotifierFamily();

  /// See also [ActorsMapNotifier].
  ActorsMapNotifierProvider call(
    Future<List<Actor>> Function(String) getActors,
  ) {
    return ActorsMapNotifierProvider(
      getActors,
    );
  }

  @override
  ActorsMapNotifierProvider getProviderOverride(
    covariant ActorsMapNotifierProvider provider,
  ) {
    return call(
      provider.getActors,
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
  String? get name => r'actorsMapNotifierProvider';
}

/// See also [ActorsMapNotifier].
class ActorsMapNotifierProvider
    extends NotifierProviderImpl<ActorsMapNotifier, Map<String, List<Actor>>> {
  /// See also [ActorsMapNotifier].
  ActorsMapNotifierProvider(
    Future<List<Actor>> Function(String) getActors,
  ) : this._internal(
          () => ActorsMapNotifier()..getActors = getActors,
          from: actorsMapNotifierProvider,
          name: r'actorsMapNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$actorsMapNotifierHash,
          dependencies: ActorsMapNotifierFamily._dependencies,
          allTransitiveDependencies:
              ActorsMapNotifierFamily._allTransitiveDependencies,
          getActors: getActors,
        );

  ActorsMapNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.getActors,
  }) : super.internal();

  final Future<List<Actor>> Function(String) getActors;

  @override
  Map<String, List<Actor>> runNotifierBuild(
    covariant ActorsMapNotifier notifier,
  ) {
    return notifier.build(
      getActors,
    );
  }

  @override
  Override overrideWith(ActorsMapNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActorsMapNotifierProvider._internal(
        () => create()..getActors = getActors,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        getActors: getActors,
      ),
    );
  }

  @override
  NotifierProviderElement<ActorsMapNotifier, Map<String, List<Actor>>>
      createElement() {
    return _ActorsMapNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActorsMapNotifierProvider && other.getActors == getActors;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, getActors.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ActorsMapNotifierRef on NotifierProviderRef<Map<String, List<Actor>>> {
  /// The parameter `getActors` of this provider.
  Future<List<Actor>> Function(String) get getActors;
}

class _ActorsMapNotifierProviderElement
    extends NotifierProviderElement<ActorsMapNotifier, Map<String, List<Actor>>>
    with ActorsMapNotifierRef {
  _ActorsMapNotifierProviderElement(super.provider);

  @override
  Future<List<Actor>> Function(String) get getActors =>
      (origin as ActorsMapNotifierProvider).getActors;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
