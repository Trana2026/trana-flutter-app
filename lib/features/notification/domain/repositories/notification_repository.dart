import 'package:trana/core/error/result.dart';
import 'package:trana/features/notification/domain/entities/notification_entity.dart';

abstract interface class NotificationRepository {
  Future<Result<NotificationPageEntity>> getNotifications({required int page});

  Future<Result<void>> readNotification(int id);

  Future<Result<void>> deleteNotification(int id);
}
