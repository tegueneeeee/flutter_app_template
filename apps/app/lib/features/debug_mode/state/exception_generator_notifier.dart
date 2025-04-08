import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exception_generator_notifier.g.dart';

@riverpod
class ExceptionGeneratorNotifier extends _$ExceptionGeneratorNotifier {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> request() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      // try {
      //   final dio = ref.read(dioProvider);
      //   await dio.safeRequest<void>(
      //     request: () {
      //       throw DioException(
      //         response: Response(
      //           statusCode: 500,
      //           requestOptions: RequestOptions(path: 'Test'),
      //         ),
      //         requestOptions: RequestOptions(path: 'Test'),
      //       );
      //     },
      //   );
      // } on AppException catch (e, _) {
      //   ref.read(appExceptionNotifierProvider.notifier).notify(e);
      //   rethrow;
      // }
    });
  }
}
