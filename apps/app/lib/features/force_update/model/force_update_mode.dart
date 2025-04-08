import 'package:flutter_app/features/force_update/model/force_update_target_version.dart';
import 'package:flutter_app/features/force_update/model/version_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'force_update_mode.freezed.dart';

@freezed
abstract class ForceUpdateMode with _$ForceUpdateMode {
  const factory ForceUpdateMode({@Default(false) bool enabled}) =
      _ForceUpdateSettingsState;

  static bool isForceUpdateEnabled({
    required VersionString currentVersion,
    required ForceUpdateTargetVersion forceUpdateTargetVersion,
  }) {
    final targetVersion = forceUpdateTargetVersion.defaultTargetPlatformVersion;
    if (targetVersion == null || targetVersion.value.isEmpty) {
      return false;
    }

    return currentVersion < targetVersion;
  }
}
