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

/// UseCase to get the remote configuration
class GetRemoteConfigUseCase extends UseCase<Future<RemoteConfig>, NoParams> {
  /// Constructor
  GetRemoteConfigUseCase({required this.repository});

  /// Repository for remote config
  final RemoteConfigRepository repository;

  @override
  Future<RemoteConfig> call(NoParams params) async {
    try {
      return repository.getRemoteConfig();
    } catch (e) {
      throw VersionInfoUnavailableException(cause: e);
    }
  }
}
