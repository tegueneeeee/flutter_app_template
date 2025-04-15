import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'get_remote_config_use_case.g.dart';

/// Provider for [GetRemoteConfigUseCase]
@riverpod
GetRemoteConfigUseCase getRemoteConfigUseCase(Ref ref) {
  return GetRemoteConfigUseCase(
    repository: ref.watch(remoteConfigRepositoryProvider),
  );
}

class GetRemoteConfigUseCase
    extends UseCase<RemoteConfig, NoParams, RemoteConfigRepository> {
  GetRemoteConfigUseCase({required super.repository});

  @override
  Future<RemoteConfig> call(NoParams params) async {
    return repository.getRemoteConfig();
  }
}
