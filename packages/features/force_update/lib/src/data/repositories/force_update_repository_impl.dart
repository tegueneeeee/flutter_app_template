import 'dart:async';

import 'package:features_force_update/src/domain/entities/force_update_target_version.dart';
import 'package:features_force_update/src/domain/repositories/force_update_repository.dart';
import 'package:features_force_update/src/domain/value_objects/version.dart';
import 'package:shared_config/config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'force_update_repository_impl.g.dart';

/// Provider for [ForceUpdateRepository]
@riverpod
ForceUpdateRepository forceUpdateRepository(Ref ref) {
  final currentVersion = ref.watch(
    appBuildConfigStateProvider.select((config) => config.requireValue.version),
  );
  final iosAppId = Env.iosAppId;
  final androidPackageId = Env.androidPackageId;

  return ForceUpdateRepositoryImpl(
    currentVersion: currentVersion,
    iosAppId: iosAppId,
    androidPackageId: androidPackageId,
  );
}

/// Implementation of [ForceUpdateRepository]
class ForceUpdateRepositoryImpl implements ForceUpdateRepository {
  /// Constructor
  const ForceUpdateRepositoryImpl({
    required this.currentVersion,
    required this.iosAppId,
    required this.androidPackageId,
  });

  /// Build configuration
  final String currentVersion;

  /// iOS App Store ID
  final String iosAppId;

  /// Android package ID
  final String androidPackageId;

  @override
  Future<ForceUpdateTargetVersion> getTargetVersion() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Mock version data - in production, this would be from an API call
    return ForceUpdateTargetVersion(
      iosVersion: Version('1.0.0'),
      androidVersion: Version('1.0.0'),
    );
  }

  @override
  Future<Version> getCurrentVersion() => Future.value(Version(currentVersion));

  @override
  String getIosAppId() => iosAppId;

  @override
  String getAndroidPackageId() => androidPackageId;
}
