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

class OpenAppStoreUseCase
    extends UseCase<void, NoParams, RemoteConfigRepository> {
  OpenAppStoreUseCase({required super.repository});

  static const iosStoreUrl = 'https://apps.apple.com/app/id';
  static const androidStoreUrl =
      'https://play.google.com/store/apps/details?id=';

  @override
  Future<void> call(NoParams params) async {
    final packageName = repository.getPackageName();
    final url = switch (defaultTargetPlatform) {
      TargetPlatform.iOS => '$iosStoreUrl$packageName',
      TargetPlatform.android => '$androidStoreUrl$packageName',
      _ => throw UnSupportedPlatformException(),
    };
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } catch (e) {
      throw AppStoreUnavailableException(cause: e);
    }
  }
}
