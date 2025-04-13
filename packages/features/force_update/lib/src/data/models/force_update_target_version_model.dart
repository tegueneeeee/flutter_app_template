import 'package:features_force_update/force_update.dart';
import 'package:features_force_update/src/domain/entities/force_update_target_version.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'force_update_target_version_model.freezed.dart';
part 'force_update_target_version_model.g.dart';

/// Force update target version model for API responses
@freezed
abstract class ForceUpdateTargetVersionModel
    with _$ForceUpdateTargetVersionModel {
  /// Creates a new [ForceUpdateTargetVersionModel]
  const factory ForceUpdateTargetVersionModel({
    required String iosVersion,
    required String androidVersion,
  }) = _ForceUpdateTargetVersionModel;

  /// Creates a [ForceUpdateTargetVersionModel]
  /// from a domain [ForceUpdateTargetVersion]
  factory ForceUpdateTargetVersionModel.fromDomain(
    ForceUpdateTargetVersion entity,
  ) => ForceUpdateTargetVersionModel(
    iosVersion: entity.iosVersion.toString(),
    androidVersion: entity.androidVersion.toString(),
  );

  /// Creates a [ForceUpdateTargetVersionModel] from JSON
  factory ForceUpdateTargetVersionModel.fromJson(Map<String, dynamic> json) =>
      _$ForceUpdateTargetVersionModelFromJson(json);

  const ForceUpdateTargetVersionModel._();
}
