import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'open_app_store_use_case.g.dart';

@riverpod
OpenAppStoreUseCase openAppStoreUseCase(Ref ref) {
  return OpenAppStoreUseCase(
    repository: ref.watch(remoteConfigRepositoryProvider),
  );
}

/// UseCase to open the appropriate app store based on platform
class OpenAppStoreUseCase extends UseCase<Future<void>, NoParams> {
  /// Constructor
  OpenAppStoreUseCase({required this.repository});

  /// Repository for remote config
  final RemoteConfigRepository repository;

  @override
  Future<void> call(NoParams params) async {
    final url = await _getStoreUrl();
    await _launchStoreUrl(url);
  }

  /// Get the store URL based on current platform
  Future<String> _getStoreUrl() async {
    final remoteConfig = await repository.getRemoteConfig();
    try {
      return switch (defaultTargetPlatform) {
        TargetPlatform.iOS => remoteConfig.iosStoreUrl,
        TargetPlatform.android => remoteConfig.androidStoreUrl,
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
