import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true, useConstantCase: true, name: 'EnvProd')
abstract class EnvProd {
  @EnviedField()
  static final String baseUrl = _EnvProd.baseUrl;
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
}
