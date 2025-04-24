import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_config/config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'open_app_store_use_case.g.dart';

@riverpod
OpenAppStoreUseCase openAppStoreUseCase(Ref ref) {
  return OpenAppStoreUseCase(
    repository: ref.watch(remoteConfigRepositoryProvider),
    packageName:
        ref.watch(appBuildConfigStateProvider).requireValue.packageName,
  );
}

/// UseCase to open the appropriate app store based on platform
class OpenAppStoreUseCase extends UseCase<Future<void>, NoParams> {
  /// Constructor
  OpenAppStoreUseCase({required this.repository, required this.packageName});

  /// Repository for remote config
  final RemoteConfigRepository repository;

  /// Package name of the app
  final String packageName;

  @override
  Future<void> call(NoParams params) async {
    final url = await _getStoreUrl();
    await _launchStoreUrl(url);
  }

  /// Get the store URL based on current platform
  Future<String> _getStoreUrl() async {
    try {
      return switch (defaultTargetPlatform) {
        TargetPlatform.iOS =>
          '${await repository.getIosStoreUrlFormat()}$packageName',
        TargetPlatform.android =>
          '${await repository.getAndroidStoreUrlFormat()}$packageName',
        _ => throw UnSupportedPlatformException(),
      };
    } catch (e) {
      if (e is AppException) rethrow;
      throw AppStoreUnavailableException(cause: e);
    }
  }

  /// Launch the URL with error handling
  Future<void> _launchStoreUrl(String url) async {
    try {
      final success = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
      if (!success) {
        throw AppStoreUnavailableException(cause: 'Could not launch URL: $url');
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw AppStoreUnavailableException(cause: e);
    }
  }
}
