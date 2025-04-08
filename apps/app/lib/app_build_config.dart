import 'package:core/build_config.dart';

final class AppBuildConfig implements BuildConfig {
  AppBuildConfig({
    required this.flavor,
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
    this.installerStore,
  });

  // Alternative constructor that takes a string flavor name
  factory AppBuildConfig.withFlavorName({
    required String appFlavor,
    required String appName,
    required String packageName,
    required String version,
    required String buildNumber,
    required String buildSignature,
    String? installerStore,
  }) {
    return AppBuildConfig(
      flavor: Flavor.values.byName(appFlavor),
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
      buildSignature: buildSignature,
      installerStore: installerStore,
    );
  }

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
  final Flavor flavor;

  @override
  final String? installerStore;

  @override
  String toString() =>
      'AppBuildConfig('
      'appName: $appName, '
      'packageName: $packageName, '
      'version: $version, '
      'buildNumber: $buildNumber, '
      'buildSignature: $buildSignature, '
      'flavor: $flavor, '
      'installerStore: $installerStore)';
}
