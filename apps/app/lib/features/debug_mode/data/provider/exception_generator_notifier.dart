import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exception_generator_notifier.g.dart';

@riverpod
class ExceptionGeneratorNotifier extends _$ExceptionGeneratorNotifier {
  @override
  Future<String> build() async {
    return Future.value('Test');
  }

  Future<void> request() async {
    state = const AsyncValue.loading();
  }
}
