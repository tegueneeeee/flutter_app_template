import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:features_remote_config/src/domain/entities/platform_versions_requirements.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_config/config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'determine_update_use_case.g.dart';

/// Provider for [DetermineUpdateUseCase]
@riverpod
DetermineUpdateUseCase determineUpdateUseCase(Ref ref) {
  return DetermineUpdateUseCase(
    buildConfig: ref.watch(appBuildConfigStateProvider),
  );
}

class DetermineUpdateUseCase
    extends UseCase<Future<UpdateType>, DetermineUpdateUseCaseParams> {
  DetermineUpdateUseCase({required this.buildConfig});

  final BuildConfig buildConfig;

  @override
  Future<UpdateType> call(DetermineUpdateUseCaseParams params) async {
    final currentVersion = Version(buildConfig.version);
    final updates = params.platformVersionsRequirements;

    final targetPlatformVersions = switch (defaultTargetPlatform) {
      TargetPlatform.iOS => updates.ios,
      TargetPlatform.android => updates.android,
      _ => throw UnSupportedPlatformException(),
    };
    if (currentVersion < targetPlatformVersions.minVersion) {
      return UpdateType.force;
    }
    if (currentVersion < targetPlatformVersions.targetVersion) {
      return UpdateType.recommended;
    }
    return UpdateType.none;
  }
}

class DetermineUpdateUseCaseParams {
  const DetermineUpdateUseCaseParams({
    required this.platformVersionsRequirements,
  });

  final PlatformVersionsRequirements platformVersionsRequirements;
}
