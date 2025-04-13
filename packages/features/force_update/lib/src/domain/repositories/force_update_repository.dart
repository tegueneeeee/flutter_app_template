import 'package:features_force_update/src/domain/entities/force_update_target_version.dart';
import 'package:features_force_update/src/domain/value_objects/version.dart';

/// Repository for force update feature
abstract interface class ForceUpdateRepository {
  /// Gets the target version information from remote source
  Future<ForceUpdateTargetVersion> getTargetVersion();

  /// Gets the current app version
  Future<Version> getCurrentVersion();

  /// Gets the iOS App Store ID
  String getIosAppId();

  /// Gets the Android package ID
  String getAndroidPackageId();
}
