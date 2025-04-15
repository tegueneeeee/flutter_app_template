import 'package:features_remote_config/remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class FakeProviders {
  static Future<List<Override>> initialize() async {
    final overrideProviders = <Override>[];

    final fakeRemoteConfigRepository = FakeRemoteConfigRepository();
    overrideProviders.addAll([
      remoteConfigRepositoryProvider.overrideWithValue(
        fakeRemoteConfigRepository,
      ),
    ]);

    return overrideProviders;
  }
}
