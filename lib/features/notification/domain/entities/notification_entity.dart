import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/notification/domain/enums/notification_category.dart';

part 'notification_entity.freezed.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required int id,
    required NotificationCategory category,
    required String title,
    required String body,
    String? deepLink,
    required bool isRead,
    DateTime? readAt,
    required DateTime createdAt,
  }) = _NotificationEntity;
}

@freezed
abstract class NotificationPageEntity with _$NotificationPageEntity {
  const factory NotificationPageEntity({
    required List<NotificationEntity> content,
    required int page,
    required bool hasNext,
  }) = _NotificationPageEntity;
}
