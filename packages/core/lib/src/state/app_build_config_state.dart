import 'package:core/src/build_config/build_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_build_config_state.g.dart';

@Riverpod(keepAlive: true)
Future<BuildConfig> appBuildConfigState(Ref ref) async {
  final packageInfo = await PackageInfo.fromPlatform();
  return AppBuildConfig.withFlavorName(
    appFlavor: const String.fromEnvironment('flavor'),
    appName: packageInfo.appName,
    packageName: packageInfo.packageName,
    version: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
    buildSignature: packageInfo.buildSignature,
    installerStore: packageInfo.installerStore,
  );
}

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
