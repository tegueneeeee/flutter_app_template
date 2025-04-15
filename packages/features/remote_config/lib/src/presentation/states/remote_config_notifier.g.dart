// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'remote_config_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$maintenanceHash() => r'7215bc2d70a19a824cadf2139cbf5e13eb3a369d';

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
String _$updateTypeHash() => r'b0bf082b3c8ef7d356bc3ca34b3c403a66c7bf32';

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
    r'9b38dcaf82b742a09bb2e080e06baaa5921235c2';

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
