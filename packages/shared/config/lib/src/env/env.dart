import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true, useConstantCase: true, name: 'EnvProd')
abstract class EnvProd {
  @EnviedField()
  static final String baseUrl = _EnvProd.baseUrl;

  @EnviedField()
  static final String iosAppId = _EnvProd.iosAppId;

  @EnviedField()
  static final String androidPackageId = _EnvProd.androidPackageId;

  @EnviedField()
  static final String newsapiApiKey = _EnvProd.newsapiApiKey;
}

@Envied(
  path: '.env.dev',
  obfuscate: true,
  useConstantCase: true,
  name: 'EnvDev',
)
abstract class EnvDev {
  @EnviedField()
  static final String baseUrl = _EnvDev.baseUrl;

  @EnviedField()
  static final String iosAppId = _EnvDev.iosAppId;

  @EnviedField()
  static final String androidPackageId = _EnvDev.androidPackageId;

  @EnviedField()
  static final String newsapiApiKey = _EnvDev.newsapiApiKey;
}

@Envied(
  path: '.env.stg',
  obfuscate: true,
  useConstantCase: true,
  name: 'EnvStg',
)
abstract class EnvStg {
  @EnviedField()
  static final String baseUrl = _EnvStg.baseUrl;

  @EnviedField()
  static final String iosAppId = _EnvStg.iosAppId;

  @EnviedField()
  static final String androidPackageId = _EnvStg.androidPackageId;

  @EnviedField()
  static final String newsapiApiKey = _EnvStg.newsapiApiKey;
}
