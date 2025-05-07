import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'remote_config_state.freezed.dart';

@freezed
abstract class RemoteConfigState with _$RemoteConfigState {
  const factory RemoteConfigState({
    @Default(false) bool maintenance,
    @Default(UpdateType.none) UpdateType updateType,
  }) = _RemoteConfigState;
}
