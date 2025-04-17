import 'dart:convert';

import 'package:features_remote_config/remote_config.dart';
import 'package:features_remote_config/src/domain/entities/platform_versions_requirements.dart';
import 'package:features_remote_config/src/domain/entities/version_requirements.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:shared_config/config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'remote_config_repository_impl.g.dart';

/// Provider for [RemoteConfigRepository]
@riverpod
RemoteConfigRepository remoteConfigRepository(RemoteConfigRepositoryRef ref) {
  final appConfig = ref.watch(appBuildConfigStateProvider).requireValue;
  return RemoteConfigRepositoryImpl(
    currentVersion: appConfig.version,
    packageName: appConfig.packageName,
  );
}

/// Implementation of [RemoteConfigRepository]
class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  /// Constructor
  RemoteConfigRepositoryImpl({
    required this.currentVersion,
    required this.packageName,
    this.firebaseRemoteConfig,
  });

  /// Current app version
  final String currentVersion;

  /// Package name
  final String packageName;

  /// Firebase Remote Config instance
  final FirebaseRemoteConfig? firebaseRemoteConfig;

  /// Fetch period for remote config (defaults to 12 hours)
  static const Duration fetchPeriod = Duration(hours: 12);

  @override
  Future<RemoteConfig> getRemoteConfig() async {
    try {
      // If Firebase Remote Config is available, use it
      if (firebaseRemoteConfig != null) {
        await _initializeFirebaseRemoteConfig();
        final model = await _parseRemoteConfigFromFirebase();
        return _mapModelToEntity(model);
      }

      // Otherwise, use local fallback configuration
      final model = await _getLocalFallbackConfig();
      return _mapModelToEntity(model);
    } catch (e) {
      // If any error occurs, use local fallback
      final model = await _getLocalFallbackConfig();
      return _mapModelToEntity(model);
    }
  }

  Future<void> _initializeFirebaseRemoteConfig() async {
    if (firebaseRemoteConfig == null) return;

    // Set minimum fetch interval
    await firebaseRemoteConfig!.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: fetchPeriod,
      ),
    );

    // Fetch and activate
    await firebaseRemoteConfig!.fetchAndActivate();
  }

  Future<RemoteConfigModel> _parseRemoteConfigFromFirebase() async {
    if (firebaseRemoteConfig == null) {
      throw StateError('Firebase Remote Config is not initialized');
    }

    // Get raw config JSON
    final configString = firebaseRemoteConfig!.getString('app_config');
    if (configString.isEmpty) {
      return _getLocalFallbackConfig();
    }

    try {
      final jsonMap = jsonDecode(configString) as Map<String, dynamic>;
      return RemoteConfigModel.fromJson(jsonMap);
    } catch (e) {
      return _getLocalFallbackConfig();
    }
  }

  Future<RemoteConfigModel> _getLocalFallbackConfig() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/remote_config_fallback.json',
      );
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return RemoteConfigModel.fromJson(jsonMap);
    } catch (e) {
      // Return absolute minimum safe default
      return const RemoteConfigModel();
    }
  }

  /// Maps the data model to the domain entity
  RemoteConfig _mapModelToEntity(RemoteConfigModel model) {
    return RemoteConfig(
      maintenance: model.maintenance,
      platformVersionsRequirements: _mapPlatformVersionsRequirements(
        model.platformVersionsRequirements,
      ),
    );
  }

  /// Maps the platform versions requirements model to the domain entity
  PlatformVersionsRequirements _mapPlatformVersionsRequirements(
    PlatformVersionsRequirementsModel model,
  ) {
    return PlatformVersionsRequirements(
      ios: _mapVersionRequirements(model.ios),
      android: _mapVersionRequirements(model.android),
    );
  }

  /// Maps the version requirements model to the domain entity
  VersionRequirements _mapVersionRequirements(VersionsRequirementsModel model) {
    return VersionRequirements(
      minVersion: Version(model.minVersion),
      targetVersion: Version(model.targetVersion),
    );
  }

  @override
  Version getCurrentVersion() => Version(currentVersion);

  @override
  String getPackageName() => packageName;
}
