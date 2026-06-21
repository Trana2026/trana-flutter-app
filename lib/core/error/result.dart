import 'package:trana/core/error/failure.dart';

/// 비동기 작업의 성공/실패를 타입으로 표현하는 sealed 클래스
sealed class Result<T> {
  const Result();
}

/// 작업 성공 시 결과 데이터를 담는 클래스
final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

/// 작업 실패 시 실패 원인을 담는 클래스
final class Failure<T> extends Result<T> {
  final AppFailure failure;
  const Failure(this.failure);
}

extension ResultExtension<T> on Result<T> {
  /// 성공 여부 확인
  bool get isSuccess => this is Success<T>;

  /// 실패 여부 확인
  bool get isFailure => this is Failure<T>;

  /// 성공 시 데이터, 실패 시 null
  T? get dataOrNull => switch (this) {
        Success(:final data) => data,
        Failure() => null,
      };

  /// 실패 시 AppFailure, 성공 시 null
  AppFailure? get failureOrNull => switch (this) {
        Success() => null,
        Failure(:final failure) => failure,
      };

  /// 성공/실패에 따라 콜백을 분기 실행
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(AppFailure failure) onFailure,
  }) =>
      switch (this) {
        Success(:final data) => onSuccess(data),
        Failure(:final failure) => onFailure(failure),
      };
}
