import 'package:shared_config/config.dart';
import 'package:shared_config/src/env/env.dart';

/// Env class provides convenient access to environment variables
/// based on the current flavor
class Env {
  const Env._();

  /// Returns the API base URL for the current flavor
  static String get apiBaseUrl => _getEnvValue(
    dev: EnvDev.baseUrl,
    stg: EnvStg.baseUrl,
    prod: EnvProd.baseUrl,
  );

  /// Returns the iOS app ID for the current flavor
  static String get iosAppId => _getEnvValue(
    dev: EnvDev.iosAppId,
    stg: EnvStg.iosAppId,
    prod: EnvProd.iosAppId,
  );

  /// Returns the Android package ID for the current flavor
  static String get androidPackageId => _getEnvValue(
    dev: EnvDev.androidPackageId,
    stg: EnvStg.androidPackageId,
    prod: EnvProd.androidPackageId,
  );

  /// Returns the NewsAPI API key for the current flavor
  static String get newsapiApiKey => _getEnvValue(
    dev: EnvDev.newsapiApiKey,
    stg: EnvStg.newsapiApiKey,
    prod: EnvProd.newsapiApiKey,
  );

  /// Helper method to get the appropriate environment value
  /// based on the current flavor
  static T _getEnvValue<T>({required T dev, required T stg, required T prod}) {
    return switch (Flavor.flavor) {
      FlavorStatus.DEVELOPMENT => dev,
      FlavorStatus.STAGING => stg,
      FlavorStatus.PRODUCTION => prod,
      _ => dev, // Fallback to development
    };
  }
}
