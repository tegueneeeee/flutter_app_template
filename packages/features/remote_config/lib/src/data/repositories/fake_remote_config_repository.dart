import 'package:features_remote_config/remote_config.dart';
import 'package:features_remote_config/src/domain/entities/platform_versions_requirements.dart';
import 'package:features_remote_config/src/domain/entities/version_requirements.dart';
import 'package:shared_config/config.dart';

/// Fake implementation of [RemoteConfigRepository]
class FakeRemoteConfigRepository implements RemoteConfigRepository {
  @override
  Future<RemoteConfig> getRemoteConfig() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return RemoteConfig(
      maintenance: false,
      platformVersionsRequirements: PlatformVersionsRequirements(
        ios: VersionRequirements(
          minVersion: Version('1.0.0'),
          targetVersion: Version('1.0.1'),
        ),
        android: VersionRequirements(
          minVersion: Version('1.0.0'),
          targetVersion: Version('1.0.1'),
        ),
      ),
    );
  }

  @override
  Version getCurrentVersion() => Version(FakeBuildConfig().version);

  @override
  String getPackageName() => FakeBuildConfig().packageName;
}
