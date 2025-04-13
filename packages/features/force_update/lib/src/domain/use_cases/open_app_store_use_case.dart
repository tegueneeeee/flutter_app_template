import 'package:features_force_update/src/data/repositories/force_update_repository_impl.dart';
import 'package:features_force_update/src/domain/exceptions/force_update_exception.dart';
import 'package:features_force_update/src/domain/repositories/force_update_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'open_app_store_use_case.g.dart';

/// Provider for [OpenAppStoreUseCase]
@riverpod
Future<OpenAppStoreUseCase> openAppStoreUseCase(Ref ref) async {
  final repository = await ref.watch(forceUpdateRepositoryProvider.future);
  return OpenAppStoreUseCase(repository: repository);
}

/// UseCase for opening the app store
class OpenAppStoreUseCase {
  /// Constructor
  const OpenAppStoreUseCase({required this.repository});

  /// Repository for force update feature
  final ForceUpdateRepository repository;
  static const iosAppStoreUrl = 'https://apps.apple.com/app/';
  static const androidPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=';

  /// Opens the app store
  /// Throws [AppStoreUnavailableException] if app store cannot be opened
  Future<void> call() async {
    try {
      // Get store URI and platform based on current platform
      final uri = switch (defaultTargetPlatform) {
        TargetPlatform.iOS => Uri.parse(
          '$iosAppStoreUrl${repository.getIosAppId()}',
        ),
        TargetPlatform.android => Uri.parse(
          '$androidPlayStoreUrl${repository.getAndroidPackageId()}',
        ),
        _ =>
          throw const AppStoreUnavailableException(cause: 'Unknown platform'),
      };

      // Try to launch the URL
      final success = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!success) {
        throw const AppStoreUnavailableException(cause: 'Failed to launch URL');
      }
    } on AppStoreUnavailableException {
      // Just re-throw our custom exception
      rethrow;
    } on Exception catch (e) {
      throw AppStoreUnavailableException(cause: e);
    }
  }
}
