// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore, deprecated_member_use

part of 'connectivity_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityServiceHash() =>
    r'accdeec60165a947fdd1bea9ce7660fb6b8a8c17';

/// Provides the ConnectivityService instance
///
/// Copied from [connectivityService].
@ProviderFor(connectivityService)
final connectivityServiceProvider = Provider<ConnectivityService>.internal(
  connectivityService,
  name: r'connectivityServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$connectivityServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConnectivityServiceRef = ProviderRef<ConnectivityService>;
String _$networkStatusHash() => r'c2b62aaf777f420cf71ffa92ac657a10aa81c025';

/// Provides the current network status
///
/// Copied from [networkStatus].
@ProviderFor(networkStatus)
final networkStatusProvider = StreamProvider<NetworkStatus>.internal(
  networkStatus,
  name: r'networkStatusProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$networkStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NetworkStatusRef = StreamProviderRef<NetworkStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
