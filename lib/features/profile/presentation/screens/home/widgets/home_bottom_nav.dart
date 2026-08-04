import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';

class HomeBottomNav extends HookConsumerWidget {
  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  final int currentIndex;
  final Function(int) onIndexChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 10),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        border: Border.all(color: vrc(context).borderPrimary!),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NavItem(
              appIcon: AppIcon.data(icon: CooliconsIcon.house01),
              activeAppIcon: AppIcon.svg(asset: 'assets/icons/home_fill.svg'),
              label: '홈',
              isActive: currentIndex == 0,
              onTap: () => onIndexChanged(0),
            ),
            const SizedBox(width: 60),
            _NavItem(
              appIcon: AppIcon.svg(asset: 'assets/icons/file_add.svg'),
              label: '계약 작성',
              isActive: currentIndex == 1,
              onTap: () {
                onIndexChanged(0);

                // 새 계약 작성 상태 초기화
                final createVM = ref.read(
                  createContractViewModelProvider.notifier,
                );
                createVM.initState();

                // EVT-013: contract_create_started
                AnalyticsService.track(
                  'contract_create_started',
                  properties: {'entry_point': 'home_bottom_nav'},
                );

                context.push(AppRoutes.selectRole);
              },
            ),
            const SizedBox(width: 60),
            _NavItem(
              appIcon: AppIcon.data(icon: CooliconsIcon.user01),
              label: '마이페이지',
              isActive: currentIndex == 2,
              onTap: () => onIndexChanged(2),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.appIcon,
    this.activeAppIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final AppIcon appIcon;
  final AppIcon? activeAppIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final itemColor = isActive
        ? vrc(context).iconPrimary!
        : vrc(context).iconDisable!;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 44,
        width: 44,
        child: Center(
          child: Column(
            children: [
              if (isActive && activeAppIcon != null)
                activeAppIcon!.copyWith(color: itemColor)
              else
                appIcon.copyWith(color: itemColor),
              const SizedBox(height: 2),
              Text(
                label,
                style: context.txt(color: itemColor, fontSize: 10, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
