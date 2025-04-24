import 'package:features_remote_config/remote_config.dart';
import 'package:features_remote_config/src/domain/entities/platform_versions_requirements.dart';
import 'package:features_remote_config/src/domain/entities/version_requirements.dart';

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
      iosStoreUrl: 'https://apps.apple.com/app/id',
      androidStoreUrl: 'https://play.google.com/store/apps/details?id=',
    );
  }

  @override
  Future<String> getAndroidStoreUrlFormat() {
    // TODO: implement getAndroidStoreUrlFormat
    throw UnimplementedError();
  }

  @override
  Future<String> getIosStoreUrlFormat() {
    // TODO: implement getIosStoreUrlFormat
    throw UnimplementedError();
  }
}
