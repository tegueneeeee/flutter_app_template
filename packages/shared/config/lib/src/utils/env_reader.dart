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
