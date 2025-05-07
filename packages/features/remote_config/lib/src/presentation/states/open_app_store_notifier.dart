import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'open_app_store_notifier.g.dart';

@riverpod
class OpenAppStoreNotifier extends _$OpenAppStoreNotifier {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> openAppStore() async {
    state = const AsyncLoading();
    final openAppStore = ref.watch(openAppStoreUseCaseProvider);
    try {
      await openAppStore(NoParams());
    } on AppException catch (e, stackTrace) {
      ref.read(appExceptionNotifierProvider.notifier).notify(e);
      state = AsyncError(e, stackTrace);
    }
  }
}
