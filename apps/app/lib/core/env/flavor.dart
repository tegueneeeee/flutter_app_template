import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor.g.dart';

/// Need override in top-level ProviderScope
@Riverpod(keepAlive: true)
Flavor flavor(FlavorRef ref) {
  throw UnimplementedError();
}

enum Flavor {
  /// Development environment
  dev,

  /// Staging environment
  stg,

  /// Production environment
  prod,
}
