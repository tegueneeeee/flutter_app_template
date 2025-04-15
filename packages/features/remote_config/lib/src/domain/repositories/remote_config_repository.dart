import 'package:features_remote_config/remote_config.dart';

/// Repository for remote config feature
abstract interface class RemoteConfigRepository {
  /// Gets the remote config information from remote source
  Future<RemoteConfig> getRemoteConfig();

  /// Gets the current version of the app
  Version getCurrentVersion();
}
