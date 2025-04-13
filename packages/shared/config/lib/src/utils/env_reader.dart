import 'package:shared_config/config.dart';
import 'package:shared_config/src/env/env.dart';

class Env {
  const Env._();

  static String apiBaseUrl = switch (Flavor.flavor) {
    FlavorStatus.DEVELOPMENT => EnvDev.baseUrl,
    FlavorStatus.STAGING => EnvStg.baseUrl,
    FlavorStatus.PRODUCTION => EnvProd.baseUrl,
    _ => EnvDev.baseUrl,
  };
  static String iosAppId = switch (Flavor.flavor) {
    FlavorStatus.DEVELOPMENT => EnvDev.iosAppId,
    FlavorStatus.STAGING => EnvStg.iosAppId,
    FlavorStatus.PRODUCTION => EnvProd.iosAppId,
    _ => EnvDev.iosAppId,
  };
  static String androidPackageId = switch (Flavor.flavor) {
    FlavorStatus.DEVELOPMENT => EnvDev.androidPackageId,
    FlavorStatus.STAGING => EnvStg.androidPackageId,
    FlavorStatus.PRODUCTION => EnvProd.androidPackageId,
    _ => EnvDev.androidPackageId,
  };
  static String newsapiApiKey = switch (Flavor.flavor) {
    FlavorStatus.DEVELOPMENT => EnvDev.newsapiApiKey,
    FlavorStatus.STAGING => EnvStg.newsapiApiKey,
    FlavorStatus.PRODUCTION => EnvProd.newsapiApiKey,
    _ => EnvDev.newsapiApiKey,
  };
}
