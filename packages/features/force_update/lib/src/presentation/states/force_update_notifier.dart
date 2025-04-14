import 'package:features_force_update/force_update.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'force_update_notifier.g.dart';

@Riverpod(keepAlive: true)
class ForceUpdateNotifier extends _$ForceUpdateNotifier {
  @override
  Future<ForceUpdateState> build() async {
    final useCase = ref.read(checkForceUpdateNeededUseCaseProvider);
    final isUpdateNeeded = await useCase();
    return ForceUpdateState(isUpdateNeeded: isUpdateNeeded);
  }

  void resume() {
    state = const AsyncData(ForceUpdateState());
  }

  Future<void> openAppStore() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(openAppStoreUseCaseProvider);
      await useCase();
      return const ForceUpdateState();
    });
  }
}
