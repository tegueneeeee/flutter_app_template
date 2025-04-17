import 'dart:async';

import 'package:flutter/foundation.dart';

/// A class that helps to debounce operations by delaying execution
/// until after a specified duration has passed since the last call.
///
/// This is useful for operations that should not be performed too often,
/// such as search queries while the user is typing.
class Debouncer {
  /// The duration to wait before executing the action.
  final Duration delay;

  /// Timer that tracks the current debounce.
  Timer? _timer;

  /// Creates a new debouncer with the specified delay.
  Debouncer({required this.delay});

  /// Run the provided action after the debounce period.
  /// If this method is called again before the delay has elapsed,
  /// the previous call will be canceled.
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  /// Runs the provided function with the given argument after the debounce period.
  ///
  /// Useful when you need to pass arguments to the debounced function.
  void runWithArg<T>(void Function(T) action, T argument) {
    _timer?.cancel();
    _timer = Timer(delay, () => action(argument));
  }

  /// Runs the provided function with the given arguments after the debounce period.
  ///
  /// Useful when you need to pass multiple arguments to the debounced function.
  void runWithArgs<T, U>(void Function(T, U) action, T arg1, U arg2) {
    _timer?.cancel();
    _timer = Timer(delay, () => action(arg1, arg2));
  }

  /// Runs the provided future-returning function after the debounce period.
  ///
  /// Returns a future that will complete when the debounced function completes.
  Future<R> runFuture<R>(Future<R> Function() action) {
    final completer = Completer<R>();
    _timer?.cancel();
    _timer = Timer(delay, () async {
      try {
        final result = await action();
        if (!completer.isCompleted) {
          completer.complete(result);
        }
      } catch (e, stackTrace) {
        if (!completer.isCompleted) {
          completer.completeError(e, stackTrace);
        }
      }
    });
    return completer.future;
  }

  /// Cancel the current debounced operation, if any.
  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  /// Check if the debouncer is currently active.
  bool get isRunning => _timer != null && _timer!.isActive;

  /// Dispose of the debouncer.
  /// This cancels any pending operations and should be called when the debouncer
  /// is no longer needed to avoid memory leaks.
  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
