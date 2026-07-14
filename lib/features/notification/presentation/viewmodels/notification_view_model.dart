import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/notification/domain/entities/notification_entity.dart';

part 'notification_view_model.freezed.dart';
part 'notification_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default([]) List<NotificationEntity> notifications, // 알림 목록
    @Default(0) int page, // 마지막으로 불러온 페이지
    @Default(true) bool hasNext, // 다음 페이지 존재 여부

    @Default(false) bool isLoading,
    String? error,
  }) = _NotificationState;
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class NotificationViewModel extends _$NotificationViewModel {
  @override
  NotificationState build() => const NotificationState();

  /// 알림 목록 최초 조회 (성공 여부 반환)
  Future<bool> loadNotifications() async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(notificationRepositoryProvider)
        .getNotifications(page: 0);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        notifications: data.content,
        page: data.page,
        hasNext: data.hasNext,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 알림 목록 추가 조회 (성공 여부 반환)
  Future<bool> loadMore() async {
    if (!state.hasNext || state.isLoading) return false;

    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(notificationRepositoryProvider)
        .getNotifications(page: state.page + 1);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoading: false,
        notifications: [...state.notifications, ...data.content],
        page: data.page,
        hasNext: data.hasNext,
      ),
      Failure(:final failure) => state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 알림 읽음 처리 (성공 여부 반환)
  Future<bool> readNotification(int id) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(notificationRepositoryProvider)
        .readNotification(id);

    switch (result) {
      case Success():
        state = state.copyWith(
          isLoading: false,
          notifications: [
            for (final n in state.notifications)
              if (n.id == id)
                n.copyWith(isRead: true, readAt: n.readAt ?? DateTime.now())
              else
                n,
          ],
        );
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }

    return result is Success;
  }

  /// 알림 삭제 (성공 여부 반환)
  Future<bool> deleteNotification(int id) async {
    state = state.copyWith(isLoading: true);

    final result = await ref
        .read(notificationRepositoryProvider)
        .deleteNotification(id);

    switch (result) {
      case Success():
        state = state.copyWith(
          isLoading: false,
          notifications: state.notifications.where((n) => n.id != id).toList(),
        );
      case Failure(:final failure):
        state = state.copyWith(isLoading: false, error: failure.message);
    }

    return result is Success;
  }

  void clearError() => state = state.copyWith(error: null);
}
