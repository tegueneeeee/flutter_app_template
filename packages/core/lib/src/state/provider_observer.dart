import 'package:core/log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.severe('''
[Provider Updated]
provider: ${provider.name ?? provider.runtimeType}
previousValue: $previousValue
newValue: $newValue
''');
  }
}
