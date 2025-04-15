import 'package:features_remote_config/remote_config.dart';
import 'package:features_remote_config/src/domain/entities/platform_versions_requirements.dart';
import 'package:features_remote_config/src/domain/entities/version_requirements.dart';

/// Fake implementation of [RemoteConfigRepository]
class FakeRemoteConfigRepository implements RemoteConfigRepository {
  @override
  Future<RemoteConfig> getRemoteConfig() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return RemoteConfig(
      maintenance: true,
      platformVersionsRequirements: PlatformVersionsRequirements(
        ios: VersionRequirements(
          minVersion: Version('9.9.9'),
          targetVersion: Version('9.9.9'),
        ),
        android: VersionRequirements(
          minVersion: Version('9.9.9'),
          targetVersion: Version('9.9.9'),
        ),
      ),
    );
  }

  @override
  Version getCurrentVersion() => Version('1.0.0');
}
