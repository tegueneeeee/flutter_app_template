import 'package:flutter_app/features/force_update/model/force_update_target_version.dart';
import 'package:flutter_app/features/force_update/model/version_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_target_version_notifier.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdateTargetVersionNotifier
    extends _$ForceUpdateTargetVersionNotifier {
  @override
  ForceUpdateTargetVersion build() {
    return ForceUpdateTargetVersion(
      android: VersionString.empty,
      ios: VersionString.empty,
    );
  }

  void update({
    required VersionString androidTargetVersion,
    required VersionString iosTargetVersion,
  }) {
    state = state.copyWith(
      android: androidTargetVersion,
      ios: iosTargetVersion,
    );
  }
}
