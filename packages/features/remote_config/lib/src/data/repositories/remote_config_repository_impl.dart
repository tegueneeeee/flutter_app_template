import 'package:features_remote_config/remote_config.dart';
import 'package:shared_config/config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'remote_config_repository_impl.g.dart';

/// Provider for [RemoteConfigRepository]
@riverpod
RemoteConfigRepository remoteConfigRepository(Ref ref) {
  final appConfig = ref.watch(appBuildConfigStateProvider).requireValue;
  return RemoteConfigRepositoryImpl(
    currentVersion: appConfig.version,
    packageName: appConfig.packageName,
  );
}

/// Implementation of [RemoteConfigRepository]
class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  RemoteConfigRepositoryImpl({
    required this.currentVersion,
    required this.packageName,
  });

  final String currentVersion;
  final String packageName;

  @override
  Future<RemoteConfig> getRemoteConfig() async {
    // TODO: implement getRemoteConfig
    throw UnimplementedError();
  }

  @override
  Version getCurrentVersion() => Version(currentVersion);

  @override
  String getPackageName() => packageName;
}
