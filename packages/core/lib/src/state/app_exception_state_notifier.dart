

import 'package:core/src/exception/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_exception_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class AppExceptionStateNotifier extends _$AppExceptionStateNotifier {
  @override
   AppException? build() {
    return null;
  }

  void notify(AppException exception) {
    state = exception;
  }

  void consume() {
    state = null;
  }
}
