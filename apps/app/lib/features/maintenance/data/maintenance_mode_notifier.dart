import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maintenance_mode_notifier.g.dart';

@Riverpod(keepAlive: true)
class MaintenanceModeNotifier extends _$MaintenanceModeNotifier {
  @override
  bool build() {
    return false;
  }

  void update({required bool enabled}) {
    state = enabled;
  }
}
