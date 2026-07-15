import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
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
        // 알림 목록 최초 조회
        final success = await notiVM.loadNotifications();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(notificationViewModelProvider);
          showErrorToast(context, state.error!);
          notiVM.clearError();
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "알림",
        onTapLeading: () => context.pop(),
      ),
      body: notiState.isLoadingNotis && notiState.notifications.isEmpty
          ? const Center(child: CustomLoadingBar())
          : notiState.notifications.isEmpty
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
              itemCount:
                  notiState.notifications.length + (notiState.hasNext ? 1 : 0),
              itemBuilder: (context, i) {
                if (i == notiState.notifications.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: notiState.isLoadingMoreNotis
                          ? const CustomLoadingBar()
                          : GestureDetector(
                              onTap: () async {
                                // 알림 목록 추가 조회
                                final success = await notiVM.loadMore();
                                if (!context.mounted) return;
                                if (!success) {
                                  final state = ref.read(
                                    notificationViewModelProvider,
                                  );
                                  showErrorToast(context, state.error!);
                                  notiVM.clearError();
                                }
                              },
                              child: Text("더보기", style: context.txt()),
                            ),
                    ),
                  );
                }

                final noti = notiState.notifications[i];
                return Dismissible(
                  key: ValueKey(noti.id),
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
                    // 알림 삭제
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
