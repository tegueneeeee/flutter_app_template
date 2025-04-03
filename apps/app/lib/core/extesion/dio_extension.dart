import 'package:dio/dio.dart';
import 'package:flutter_app/core/exception/app_exception.dart';

extension DioExtension on Dio {
  Future<T> safeRequest<T>({required Future<T> Function() request}) =>
      _wrapDioException<T>(request);

  /// Handle [DioException] and convert it to [AppException]
  Future<T> _wrapDioException<T>(Future<T> Function() request) async {
    try {
      final result = await request();
      return result;
    } on DioException catch (e) {
      final networkException = _convertDioExceptionToNetworkException(e);
      throw networkException;
    }
  }

  AppException _convertDioExceptionToNetworkException(DioException e) {
    return NetworkException.fromStatusCode(e.response?.statusCode);
  }
}
