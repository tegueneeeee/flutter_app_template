import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_config/config.dart';

part 'app_build_config.g.dart';

/// Provider for accessing BuildConfig information throughout the app
@Riverpod(keepAlive: true)
BuildConfig appBuildConfigState(Ref ref) => throw UnimplementedError();

/// Implementation of BuildConfig that contains actual build configuration
final class AppBuildConfig implements BuildConfig {
  /// Creates a new AppBuildConfig instance
  const AppBuildConfig({
    required this.flavor,
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.buildSignature,
    this.installerStore,
  });

  /// Alternative constructor that takes a string flavor name
  /// and maps it to the appropriate FlavorStatus
  factory AppBuildConfig.withFlavorName({
    required String appFlavor,
    required String appName,
    required String packageName,
    required String version,
    required String buildNumber,
    required String buildSignature,
    String? installerStore,
  }) {
    final flavorStatus = switch (appFlavor) {
      'dev' => FlavorStatus.DEVELOPMENT,
      'stg' => FlavorStatus.STAGING,
      'prod' => FlavorStatus.PRODUCTION,
      _ => FlavorStatus.DEVELOPMENT, // Default to development if unknown
    };
    return AppBuildConfig(
      flavor: flavorStatus,
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
  final FlavorStatus flavor;

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
