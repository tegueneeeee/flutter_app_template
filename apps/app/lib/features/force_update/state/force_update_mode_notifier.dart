import 'package:flutter_app/features/force_update/model/force_update_mode.dart';
import 'package:flutter_app/features/force_update/state/force_update_target_version_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'force_update_mode_notifier.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdateModeNotifier extends _$ForceUpdateModeNotifier {
  @override
  ForceUpdateMode build() {
    final forceUpdateTargetVersion = ref.watch(
      forceUpdateTargetVersionNotifierProvider,
    );
    // final currentVersion = ref.watch(
    //   appBuildConfigStateProvider.select((value) => value.requireValue.version),
    // );

    // final enabled = ForceUpdateMode.isForceUpdateEnabled(
    //   currentVersion: VersionString(currentVersion),
    //   forceUpdateTargetVersion: forceUpdateTargetVersion,
    // );
    return const ForceUpdateMode(enabled: true);
  }

  void disable() {
    state = state.copyWith(enabled: false);
  }
}
