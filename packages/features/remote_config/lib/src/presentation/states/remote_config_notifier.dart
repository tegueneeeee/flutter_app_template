import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'remote_config_notifier.g.dart';

@Riverpod(keepAlive: true)
class RemoteConfigNotifier extends _$RemoteConfigNotifier {
  @override
  Future<RemoteConfigState> build() async {
    final getRemoteConfig = ref.read(getRemoteConfigUseCaseProvider);
    final determineUpdate = ref.read(determineUpdateUseCaseProvider);

    final remoteConfig = await getRemoteConfig(NoParams());
    final updateType = await determineUpdate(
      DetermineUpdateUseCaseParams(
        platformVersionsRequirements: remoteConfig.platformVersionsRequirements,
      ),
    );

    return RemoteConfigState(
      maintenance: remoteConfig.maintenance,
      updateType: updateType,
    );
  }

  void updateMaintenance({required bool value}) {
    state = state.whenData((data) => data.copyWith(maintenance: value));
  }

  void updateType(UpdateType value) {
    state = state.whenData((data) => data.copyWith(updateType: value));
  }
}

@riverpod
bool maintenance(Ref ref) {
  final maintenance = ref.watch(
    remoteConfigNotifierProvider.select(
      (value) => value.valueOrNull?.maintenance,
    ),
  );
  return maintenance ?? false;
}

@riverpod
UpdateType updateType(Ref ref) {
  final updateType = ref.watch(
    remoteConfigNotifierProvider.select(
      (value) => value.valueOrNull?.updateType,
    ),
  );
  return updateType ?? UpdateType.none;
}
