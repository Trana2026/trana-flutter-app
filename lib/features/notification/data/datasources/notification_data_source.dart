import 'package:dio/dio.dart';
import 'package:trana/features/notification/data/dtos/notification_dto.dart';

class NotificationDataSource {
  const NotificationDataSource(this.dio);

  final Dio dio;

  /// GET 알림 목록 조회 (페이징)
  Future<NotificationPageDto> getNotifications({required int page}) async {
    final size = 20; // 페이지 크기 (알림 조회 개수, 1~50)
    final response = await dio.get<Map<String, dynamic>>(
      '/v1/notifications',
      queryParameters: {'page': page, 'size': size},
    );
    return NotificationPageDto.fromJson(response.data!);
  }

  /// PATCH 알림 읽음 처리
  Future<void> readNotification(int id) async {
    await dio.patch<void>('/v1/notifications/$id/read');
  }

  /// DELETE 알림 삭제 (hard delete)
  Future<void> deleteNotification(int id) async {
    await dio.delete<void>('/v1/notifications/$id');
  }
}
