import 'package:core/monitoring.dart';
import 'package:core/state.dart';
import 'package:flutter_app/app_build_config.dart';
import 'package:flutter_app/core/data/shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef InitializedValues = ({List<Override> overrideProviders});

final class AppInitializer {
  AppInitializer._();

  static Future<InitializedValues> initialize() async {
    final overrideProviders = await _initializeProviders();
    return (overrideProviders: overrideProviders);
  }

  static Future<List<Override>> _initializeProviders() async {
    final overrides = <Override>[];

    final packageInfo = await PackageInfo.fromPlatform();
    final preferences = await SharedPreferences.getInstance();

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
    overrides.addAll([
      sharedPreferencesProvider.overrideWithValue(preferences),
      buildConfigStateProvider.overrideWithValue(buildConfig),
    ]);
    return overrides;
  }
}
