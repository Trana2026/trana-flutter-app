import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
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
    final mypageDevices = ref.watch(
      myPageViewModelProvider.select((s) => s.devices),
    );
    final currentDeviceId = ref.watch(
      deviceTokenViewModelProvider.select((s) => s.currentDeviceId),
    );

    // 현재 기기를 최상단에 배치
    final devices = [
      ...mypageDevices.where((d) => d.id == currentDeviceId),
      ...mypageDevices.where((d) => d.id != currentDeviceId),
    ];

    useEffect(() {
      // EVT-062: profile_section_opened
      AnalyticsService.track(
        'profile_section_opened',
        properties: {'profile_section': 'device_management'},
        ga4: false,
      );
      return null;
    }, const []);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "로그인 기기 관리",
        onTapLeading: () => context.pop(),
      ),
      body: devices.isEmpty
          ? Center(
              child: Text(
                "연결된 기기가 없어요",
                style: context.txt(color: vrc(context).textPrimary),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: devices.length,
              itemBuilder: (_, i) => _DeviceListItem(device: devices[i]),
            ),
    );
  }
}

class _DeviceListItem extends HookConsumerWidget {
  const _DeviceListItem({required this.device});

  final DeviceTokenEntity device;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDeviceId = ref.watch(
      deviceTokenViewModelProvider.select((s) => s.currentDeviceId),
    );
    final isPending = useState(false);

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
            child: AppIcon.data(icon: CooliconsIcon.mobileButton, size: 16),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.deviceModel ?? "알 수 없는 기기",
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "${device.osVersion ?? "버전 정보 없음"} • ${device.lastUsedAt.timeAgo}",
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
                if (isPending.value) return;
                isPending.value = true;
                try {
                  // 기기 강제 해제
                  final deviceVM = ref.read(
                    deviceTokenViewModelProvider.notifier,
                  );
                  final success = await deviceVM.disconnect(device.id);
                  if (!context.mounted) return;
                  if (!success) {
                    final state = ref.read(deviceTokenViewModelProvider);
                    showErrorToast(context, state.error!);
                    deviceVM.clearError();
                  }
                } finally {
                  if (context.mounted) isPending.value = false;
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
