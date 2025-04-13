import 'package:shared_dependencies/dependencies.dart';

part 'force_update_state.freezed.dart';

@freezed
abstract class ForceUpdateState with _$ForceUpdateState {
  const factory ForceUpdateState({@Default(false) bool isUpdateNeeded}) =
      _ForceUpdateState;
}
