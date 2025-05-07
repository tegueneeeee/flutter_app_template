import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'remote_config_state.freezed.dart';
part 'remote_config_state.g.dart';

@Riverpod(keepAlive: true)
Future<RemoteConfigState> remoteConfigState(Ref ref) async {
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

@riverpod
bool maintenance(Ref ref) {
  final maintenance = ref.watch(
    remoteConfigStateProvider.select((value) => value.valueOrNull?.maintenance),
  );
  return maintenance ?? false;
}

@riverpod
UpdateType updateType(Ref ref) {
  final updateType = ref.watch(
    remoteConfigStateProvider.select((value) => value.valueOrNull?.updateType),
  );
  return updateType ?? UpdateType.none;
}

@freezed
abstract class RemoteConfigState with _$RemoteConfigState {
  const factory RemoteConfigState({
    @Default(false) bool maintenance,
    @Default(UpdateType.none) UpdateType updateType,
  }) = _RemoteConfigState;
}
