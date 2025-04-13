import 'package:features_force_update/force_update.dart';
import 'package:shared_dependencies/dependencies.dart';

part 'force_update_notifier.g.dart';

@riverpod
class ForceUpdateNotifier extends _$ForceUpdateNotifier {
  @override
  Future<ForceUpdateState> build() async {
    return const ForceUpdateState();
  }

  Future<void> checkUpdateRequired() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final useCase = ref.read(checkForceUpdateNeededUseCaseProvider);
      final isUpdateNeeded = await useCase();
      return ForceUpdateState(isUpdateNeeded: isUpdateNeeded);
    });
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
