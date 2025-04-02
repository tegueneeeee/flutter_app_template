import 'package:riverpod_annotation/riverpod_annotation.dart';

typedef InitializedValues = ({List<Override> overrideProviders});

final class AppInitializer {
  AppInitializer._();

  static Future<InitializedValues> initialize() async {
    final overrideProviders = await _initializeProviders();
    return (overrideProviders: overrideProviders);
  }

  static Future<List<Override>> _initializeProviders() async {
    final overrides = <Override>[];

    // final packageInfo = await PackageInfo.fromPlatform();
    // final preferences = await SharedPreferences.getInstance();

    // final buildConfig = AppBuildConfig(
    //   // NOTE: この buildConfig で集約するため限定的に許可
    //   // ignore: do_not_use_environment
    //   appFlavor: const String.fromEnvironment('flavor'),
    //   appName: packageInfo.appName,
    //   packageName: packageInfo.packageName,
    //   version: packageInfo.version,
    //   buildNumber: packageInfo.buildNumber,
    //   buildSignature: packageInfo.buildSignature,
    //   installerStore: packageInfo.installerStore,
    // );

    // logger.info(buildConfig);

    // overrides.addAll([
    //   sharedPreferencesProvider.overrideWithValue(preferences),
    //   buildConfigProvider.overrideWithValue(buildConfig),
    // ]);
    return overrides;
  }
}
