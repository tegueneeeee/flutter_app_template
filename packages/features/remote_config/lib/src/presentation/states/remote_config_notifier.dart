import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'remote_config_notifier.g.dart';

@Riverpod(keepAlive: true)
class RemoteConfigNotifier extends _$RemoteConfigNotifier {
  @override
  Future<RemoteConfigState> build() async {
    final getRemoteConfig = ref.watch(getRemoteConfigUseCaseProvider);
    final determineUpdate = ref.watch(determineUpdateUseCaseProvider);

    final remoteConfig = await getRemoteConfig(NoParams());
    final updateType = await determineUpdate(
      DetermineUpdateUseCaseParams(
        updates: remoteConfig.platformVersionsRequirements,
      ),
    );

    return RemoteConfigState(
      isMaintenance: remoteConfig.maintenance,
      updateType: updateType,
    );
  }
}
