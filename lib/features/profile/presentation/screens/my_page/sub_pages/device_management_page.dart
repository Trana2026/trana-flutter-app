import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/utils/date_time_extensions.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/profile/domain/entities/device_token_entity.dart';
import 'package:trana/features/profile/presentation/viewmodels/device_token_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

class DeviceManagementPage extends HookConsumerWidget {
  const DeviceManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mypageState = ref.watch(myPageViewModelProvider);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "로그인 기기 관리",
        onTapLeading: () => context.pop(),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: mypageState.devices.length,
        itemBuilder: (_, i) => _DeviceListItem(device: mypageState.devices[i]),
      ),
    );
  }
}

class _DeviceListItem extends HookConsumerWidget {
  const _DeviceListItem({required this.device});

  final DeviceTokenEntity device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceVM = ref.read(deviceTokenViewModelProvider.notifier);

    // TODO: 실제 기기 정보에 맞게 변경 (백엔드 구현되면)
    final int currentDeviceId = 1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: vrc(context).borderPrimary!)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: vrc(context).secondaryColor,
            ),
            child: AppIcon.data(icon: CooliconsIcon.desktop, size: 16),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "iPhone 13",
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Seoul, Korea • ${device.lastUsedAt.timeAgo}",
                  style: context.txt(
                    color: vrc(context).textTertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          if (currentDeviceId == device.id)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: fxc(context).opacitySuccess,
              ),
              child: Text(
                "현재 기기",
                style: context.txt(color: fxc(context).textGreen, fontSize: 12),
              ),
            )
          else
            GestureDetector(
              onTap: () async {
                final success = await deviceVM.disconnect(device.id);
                if (!context.mounted) return;
                if (!success) {
                  final state = ref.read(deviceTokenViewModelProvider);
                  showErrorToast(context, state.error!);
                  deviceVM.clearError();
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: fxc(context).opacityError,
                ),
                child: Text(
                  "로그아웃",
                  style: context.txt(
                    color: fxc(context).textDanger,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
