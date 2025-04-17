// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'remote_config_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$maintenanceHash() => r'02a144d8e21f402ac1e12d50d2a096cd138b355c';

/// See also [maintenance].
@ProviderFor(maintenance)
final maintenanceProvider = AutoDisposeProvider<bool>.internal(
  maintenance,
  name: r'maintenanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$maintenanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MaintenanceRef = AutoDisposeProviderRef<bool>;
String _$updateTypeHash() => r'59b499e4f0931f19ed310d5295717be2502ee6dc';

/// See also [updateType].
@ProviderFor(updateType)
final updateTypeProvider = AutoDisposeProvider<UpdateType>.internal(
  updateType,
  name: r'updateTypeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$updateTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateTypeRef = AutoDisposeProviderRef<UpdateType>;
String _$remoteConfigNotifierHash() =>
    r'69bc82cf989aaa70ffb5f205f6c9b2f8ded79854';

/// See also [RemoteConfigNotifier].
@ProviderFor(RemoteConfigNotifier)
final remoteConfigNotifierProvider =
    AsyncNotifierProvider<RemoteConfigNotifier, RemoteConfigState>.internal(
      RemoteConfigNotifier.new,
      name: r'remoteConfigNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$remoteConfigNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RemoteConfigNotifier = AsyncNotifier<RemoteConfigState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
