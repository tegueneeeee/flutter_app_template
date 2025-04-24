import 'package:features_remote_config/remote_config.dart';

/// Repository for remote config feature
abstract interface class RemoteConfigRepository {
  /// Gets the remote config information from remote source
  Future<RemoteConfig> getRemoteConfig();

  /// Gets the iOS App Store URL format
  Future<String> getIosStoreUrlFormat();

  /// Gets the Android Play Store URL format
  Future<String> getAndroidStoreUrlFormat();
}
