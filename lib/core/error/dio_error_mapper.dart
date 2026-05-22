import 'package:dio/dio.dart';
import 'package:trana/core/error/failure.dart';

extension DioExceptionMapper on DioException {
  AppFailure toFailure() {
    if (response?.statusCode == 401) return const UnauthorizedFailure();
    if (type == DioExceptionType.connectionError ||
        type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.receiveTimeout) {
      return const NetworkFailure();
    }
    return const ServerFailure();
  }
}
