import 'package:core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_config/config.dart';
import 'package:shared_dependencies/dependencies.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class AppProviders {
  static Future<List<Override>> initialize() async {
    final overrideProviders = <Override>[];

    final packageInfo = await PackageInfo.fromPlatform();
    final sharedPreferences = await SharedPreferences.getInstance();

    final buildConfig = AppBuildConfig.withFlavorName(
      appFlavor: const String.fromEnvironment('flavor'),
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      buildSignature: packageInfo.buildSignature,
      installerStore: packageInfo.installerStore,
    );

    logger.info(buildConfig);

    overrideProviders.addAll([
      appBuildConfigStateProvider.overrideWithValue(buildConfig),
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ]);

    return overrideProviders;
  }
}
