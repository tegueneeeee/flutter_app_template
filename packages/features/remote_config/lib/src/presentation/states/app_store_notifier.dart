import 'package:core/core.dart';
import 'package:features_remote_config/remote_config.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'app_store_notifier.g.dart';

@riverpod
class AppStoreNotifier extends _$AppStoreNotifier {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> openAppStore() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(openAppStoreUseCaseProvider)(NoParams()),
    );
  }
}
