import 'package:features_force_update/force_update.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_force_update_needed_use_case.g.dart';

/// Provider for [CheckForceUpdateNeededUseCase]
@riverpod
Future<CheckForceUpdateNeededUseCase> checkForceUpdateNeededUseCase(
  Ref ref,
) async {
  final repository = await ref.watch(forceUpdateRepositoryProvider.future);
  return CheckForceUpdateNeededUseCase(repository: repository);
}

/// UseCase for checking if force update is needed
class CheckForceUpdateNeededUseCase {
  /// Constructor
  const CheckForceUpdateNeededUseCase({required this.repository});

  /// Repository for force update feature
  final ForceUpdateRepository repository;

  /// Checks if force update is needed
  /// Returns true if the app needs to be updated, false otherwise
  Future<bool> call() async {
    try {
      // Get current and target versions
      final currentVersion = await repository.getCurrentVersion();
      final targetVersion = await repository.getTargetVersion();

      // Check if current version is older than target version based on platform
      return switch (defaultTargetPlatform) {
        TargetPlatform.iOS => currentVersion < targetVersion.iosVersion,
        TargetPlatform.android => currentVersion < targetVersion.androidVersion,
        _ =>
          throw const VersionInfoUnavailableException(
            cause: 'Unknown platform',
          ),
      };
    } on Exception catch (e) {
      throw VersionInfoUnavailableException(cause: e);
    }
  }
}
