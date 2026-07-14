import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/notification/data/datasources/notification_data_source.dart';
import 'package:trana/features/notification/data/mappers/notification_mapper.dart';
import 'package:trana/features/notification/domain/entities/notification_entity.dart';
import 'package:trana/features/notification/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl(this.dataSource);

  final NotificationDataSource dataSource;

  @override
  Future<Result<NotificationPageEntity>> getNotifications({
    required int page,
  }) async {
    try {
      final dto = await dataSource.getNotifications(page: page);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ForbiddenFailure('입력값 검증에 실패했습니다.'));
      }
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('인증이 필요합니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> readNotification(int id) async {
    try {
      await dataSource.readNotification(id);
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('인증이 필요합니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(ForbiddenFailure('알림을 찾을 수 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> deleteNotification(int id) async {
    try {
      await dataSource.deleteNotification(id);
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(ForbiddenFailure('인증이 필요합니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(ForbiddenFailure('알림을 찾을 수 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
