import 'package:shared_config/config.dart';

abstract interface class BuildConfig {
  abstract final String appName;
  abstract final String packageName;
  abstract final String version;
  abstract final String buildNumber;
  abstract final String buildSignature;
  abstract final FlavorStatus flavor;
  abstract final String? installerStore;
}

final class FakeBuildConfig implements BuildConfig {
  FakeBuildConfig({
    this.appName = 'Fake App',
    this.packageName = 'com.example.fake_app',
    this.version = '1.0.0',
    this.buildNumber = '1',
    this.buildSignature = '1',
    this.flavor = FlavorStatus.DEVELOPMENT,
    this.installerStore = 'fake_store',
  });

  /// Creates a default fake configuration for testing
  factory FakeBuildConfig.forTest() => FakeBuildConfig();

  @override
  final String appName;
  @override
  final String packageName;
  @override
  final String version;
  @override
  final String buildNumber;
  @override
  final String buildSignature;
  @override
  final FlavorStatus flavor;
  @override
  final String? installerStore;
}
