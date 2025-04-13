// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'open_app_store_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$openAppStoreUseCaseHash() =>
    r'7e3d90a5f532b09b8c5855d580dfb768c324e369';

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

/// Provider for [OpenAppStoreUseCase]
///
/// Copied from [openAppStoreUseCase].
@ProviderFor(openAppStoreUseCase)
const openAppStoreUseCaseProvider = OpenAppStoreUseCaseFamily();

/// Provider for [OpenAppStoreUseCase]
///
/// Copied from [openAppStoreUseCase].
class OpenAppStoreUseCaseFamily extends Family<OpenAppStoreUseCase> {
  /// Provider for [OpenAppStoreUseCase]
  ///
  /// Copied from [openAppStoreUseCase].
  const OpenAppStoreUseCaseFamily();

  /// Provider for [OpenAppStoreUseCase]
  ///
  /// Copied from [openAppStoreUseCase].
  OpenAppStoreUseCaseProvider call({
    required String appId,
    required String packageId,
  }) {
    return OpenAppStoreUseCaseProvider(appId: appId, packageId: packageId);
  }

  @override
  OpenAppStoreUseCaseProvider getProviderOverride(
    covariant OpenAppStoreUseCaseProvider provider,
  ) {
    return call(appId: provider.appId, packageId: provider.packageId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'openAppStoreUseCaseProvider';
}

/// Provider for [OpenAppStoreUseCase]
///
/// Copied from [openAppStoreUseCase].
class OpenAppStoreUseCaseProvider
    extends AutoDisposeProvider<OpenAppStoreUseCase> {
  /// Provider for [OpenAppStoreUseCase]
  ///
  /// Copied from [openAppStoreUseCase].
  OpenAppStoreUseCaseProvider({
    required String appId,
    required String packageId,
  }) : this._internal(
         (ref) => openAppStoreUseCase(
           ref as OpenAppStoreUseCaseRef,
           appId: appId,
           packageId: packageId,
         ),
         from: openAppStoreUseCaseProvider,
         name: r'openAppStoreUseCaseProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$openAppStoreUseCaseHash,
         dependencies: OpenAppStoreUseCaseFamily._dependencies,
         allTransitiveDependencies:
             OpenAppStoreUseCaseFamily._allTransitiveDependencies,
         appId: appId,
         packageId: packageId,
       );

  OpenAppStoreUseCaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appId,
    required this.packageId,
  }) : super.internal();

  final String appId;
  final String packageId;

  @override
  Override overrideWith(
    OpenAppStoreUseCase Function(OpenAppStoreUseCaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpenAppStoreUseCaseProvider._internal(
        (ref) => create(ref as OpenAppStoreUseCaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appId: appId,
        packageId: packageId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<OpenAppStoreUseCase> createElement() {
    return _OpenAppStoreUseCaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpenAppStoreUseCaseProvider &&
        other.appId == appId &&
        other.packageId == packageId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appId.hashCode);
    hash = _SystemHash.combine(hash, packageId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OpenAppStoreUseCaseRef on AutoDisposeProviderRef<OpenAppStoreUseCase> {
  /// The parameter `appId` of this provider.
  String get appId;

  /// The parameter `packageId` of this provider.
  String get packageId;
}

class _OpenAppStoreUseCaseProviderElement
    extends AutoDisposeProviderElement<OpenAppStoreUseCase>
    with OpenAppStoreUseCaseRef {
  _OpenAppStoreUseCaseProviderElement(super.provider);

  @override
  String get appId => (origin as OpenAppStoreUseCaseProvider).appId;
  @override
  String get packageId => (origin as OpenAppStoreUseCaseProvider).packageId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
