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
  const NotificationState._();

  const factory NotificationState({
    @Default([]) List<NotificationEntity> notifications, // 알림 목록
    @Default(0) int page, // 마지막으로 불러온 페이지
    @Default(false) bool hasNext, // 다음 페이지 존재 여부

    @Default(false) bool isLoadingNotis, // 최초 목록 로드 중 여부
    @Default(false) bool isLoadingMoreNotis, // 추가 목록 로드 중 여부
    String? error,
  }) = _NotificationState;

  // 읽지 않은 알림 목록
  List<NotificationEntity> get unreadNotis =>
      notifications.where((n) => !n.isRead).toList();
}

// ==================== ViewModel ====================

@Riverpod(keepAlive: true)
class NotificationViewModel extends _$NotificationViewModel {
  @override
  NotificationState build() => const NotificationState();

  /// 알림 목록 최초 조회 (성공 여부 반환)
  Future<bool> loadNotifications() async {
    state = state.copyWith(isLoadingNotis: true);

    final result = await ref
        .read(notificationRepositoryProvider)
        .getNotifications(page: 0);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoadingNotis: false,
        notifications: data.content,
        page: data.page,
        hasNext: data.hasNext,
      ),
      Failure(:final failure) => state.copyWith(
        isLoadingNotis: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 알림 목록 추가 조회 (성공 여부 반환)
  Future<bool> loadMore() async {
    if (!state.hasNext || state.isLoadingMoreNotis) return false;

    state = state.copyWith(isLoadingMoreNotis: true);

    final result = await ref
        .read(notificationRepositoryProvider)
        .getNotifications(page: state.page + 1);

    state = switch (result) {
      Success(:final data) => state.copyWith(
        isLoadingMoreNotis: false,
        notifications: [...state.notifications, ...data.content],
        page: data.page,
        hasNext: data.hasNext,
      ),
      Failure(:final failure) => state.copyWith(
        isLoadingMoreNotis: false,
        error: failure.message,
      ),
    };

    return result is Success;
  }

  /// 알림 읽음 처리 (성공 여부 반환)
  Future<bool> readNotification(int id) async {
    final result = await ref
        .read(notificationRepositoryProvider)
        .readNotification(id);

    switch (result) {
      case Success():
        state = state.copyWith(
          notifications: [
            for (final n in state.notifications)
              if (n.id == id)
                n.copyWith(isRead: true, readAt: n.readAt ?? DateTime.now())
              else
                n,
          ],
        );
      case Failure(:final failure):
        state = state.copyWith(error: failure.message);
    }

    return result is Success;
  }

  /// 알림 삭제 (성공 여부 반환)
  Future<bool> deleteNotification(int id) async {
    final result = await ref
        .read(notificationRepositoryProvider)
        .deleteNotification(id);

    if (result case Failure(:final failure)) {
      state = state.copyWith(error: failure.message);
      return false;
    }

    await loadNotifications();
    return true;
  }

  void clearError() => state = state.copyWith(error: null);
}
