import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/notification/data/dtos/notification_dto.dart';
import 'package:trana/features/notification/domain/entities/notification_entity.dart';
import 'package:trana/features/notification/domain/enums/notification_category.dart';

extension NotificationMapper on NotificationDto {
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      category: NotificationCategory.values.fromApiString(category),
      title: title,
      body: body,
      deepLink: deepLink,
      isRead: isRead,
      readAt: readAt,
      createdAt: createdAt,
    );
  }
}

extension NotificationPageMapper on NotificationPageDto {
  NotificationPageEntity toEntity() {
    return NotificationPageEntity(
      content: content.map((dto) => dto.toEntity()).toList(),
      page: page,
      hasNext: hasNext,
    );
  }
}
