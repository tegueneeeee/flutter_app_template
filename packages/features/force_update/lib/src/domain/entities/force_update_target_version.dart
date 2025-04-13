import 'package:features_force_update/src/data/models/force_update_target_version_model.dart'
    show ForceUpdateTargetVersionModel;
import 'package:features_force_update/src/domain/value_objects/value_objects.dart';

/// Represents the target version information for the force update feature
class ForceUpdateTargetVersion {
  /// Constructor
  const ForceUpdateTargetVersion({
    required this.iosVersion,
    required this.androidVersion,
  });

  /// Creates a [ForceUpdateTargetVersion]
  /// from a [ForceUpdateTargetVersionModel]
  factory ForceUpdateTargetVersion.fromModel(
    ForceUpdateTargetVersionModel model,
  ) => ForceUpdateTargetVersion(
    iosVersion: Version(model.iosVersion),
    androidVersion: Version(model.androidVersion),
  );

  /// The minimum required iOS version
  final Version iosVersion;

  /// The minimum required Android version
  final Version androidVersion;
  @override
  String toString() =>
      'ForceUpdateTargetVersion('
      'iosVersion: $iosVersion, '
      'androidVersion: $androidVersion)';
}
