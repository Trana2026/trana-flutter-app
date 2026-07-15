import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required int id,
    required String category,
    required String title,
    required String body,
    String? deepLink,
    required bool isRead,
    DateTime? readAt,
    required DateTime createdAt,
  }) = _NotificationDto;

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}

@freezed
abstract class NotificationPageDto with _$NotificationPageDto {
  const factory NotificationPageDto({
    required List<NotificationDto> content,
    required int page,
    required int size,
    required int totalElements,
    required int totalPages,
    required bool hasNext,
  }) = _NotificationPageDto;

  factory NotificationPageDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationPageDtoFromJson(json);
}
