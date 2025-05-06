import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_config/config.dart';
import 'package:shared_config/src/env/env.dart';

@Riverpod(keepAlive: true)
Env env(Ref ref) {
  final buildConfig = ref.watch(appBuildConfigStateProvider);

  return switch (buildConfig.flavor) {
    FlavorStatus.STAGING => Env(baseUrl: EnvStg.baseUrl),
    FlavorStatus.PRODUCTION => Env(baseUrl: EnvProd.baseUrl),
    // Fallback to development
    _ => Env(baseUrl: EnvDev.baseUrl),
  };
}

class Env {
  const Env({required this.baseUrl});
  final String baseUrl;
}
