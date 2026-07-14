import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/notification/presentation/screens/notification/widgets/notification_item.dart';
import 'package:trana/features/notification/presentation/viewmodels/notification_view_model.dart';

class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notiState = ref.watch(notificationViewModelProvider);
    final notiVM = ref.read(notificationViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final success = await notiVM.loadNotifications();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(notificationViewModelProvider);
          showErrorToast(context, state.error!);
          notiVM.clearError();
        }
        notiVM.loadNotifications();
      });
      return null;
    }, []);

    // TODO : 더미데이터 삭제 > 실제 알림 목록 연결 (백엔드 구현되면)
    // final notifications = useState<List<NotificationEntity>>([
    //   NotificationEntity(
    //     id: -1,
    //     category: NotificationCategory.contract,
    //     title: '트라나',
    //     body: 'Bluemon님 과의 계약서가 생성되었어요. 자세한 계약서를 확인하려면 클릭해주세요.',
    //     isRead: false,
    //     createdAt: DateTime.now().subtract(const Duration(minutes: 1)), // 1분 전
    //   ),
    //   NotificationEntity(
    //     id: -2,
    //     category: NotificationCategory.contract,
    //     title: '트라나',
    //     body: 'Bluemon님 과의 계약서가 생성되었어요. 자세한 계약서를 확인하려면 클릭해주세요.',
    //     isRead: false,
    //     createdAt: DateTime.now().subtract(const Duration(minutes: 1)), // 1분 전
    //   ),
    //   NotificationEntity(
    //     id: -3,
    //     category: NotificationCategory.contract,
    //     title: '하이파이브',
    //     body: '조안님과의 미팅이 예정되어 있습니다. 자세한 내용을 확인하려면 클릭해주세요.',
    //     isRead: false,
    //     createdAt: DateTime.now().subtract(const Duration(minutes: 5)), // 5분 전
    //   ),
    //   NotificationEntity(
    //     id: -4,
    //     category: NotificationCategory.contract,
    //     title: '코드리뷰',
    //     body: '마이크님이 제출한 코드 리뷰 요청이 도착했습니다. 확인 후 피드백을 남겨주세요.',
    //     isRead: false,
    //     createdAt: DateTime.now().subtract(
    //       const Duration(minutes: 10),
    //     ), // 10분 전
    //   ),
    // ]);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "알림",
        onTapLeading: () => context.pop(),
      ),
      body: notiState.notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppIcon.svg(
                    asset: "assets/icons/chat_bubble_fill.svg",
                    size: 28,
                    color: fxc(context).brandColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "새로운 알림이 없어요",
                    style: context.txt(
                      color: vrc(context).textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: notiState.notifications.length,
              itemBuilder: (context, i) {
                final noti = notiState.notifications[i];

                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: fxc(context).statusError,
                    padding: const EdgeInsets.only(right: 24),
                    child: Icon(
                      CooliconsIcon.trashFull,
                      color: vrc(context).iconPrimary,
                    ),
                  ),
                  onDismissed: (_) async {
                    final success = await notiVM.deleteNotification(noti.id);
                    if (!context.mounted) return;
                    if (!success) {
                      final state = ref.read(notificationViewModelProvider);
                      showErrorToast(context, state.error!);
                      notiVM.clearError();
                    }
                  },
                  child: NotificationItem(noti: noti),
                );
              },
            ),
    );
  }
}
