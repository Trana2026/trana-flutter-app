import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_consent_sign_dialog.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';

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
    final me = ref.watch(meProvider).value;
    final isMinor = me?.ageGroup == 'MINOR';

    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 10),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: vrc(context).borderPrimary!),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NavItem(
              icon: CooliconsIcon.house01,
              activeIcon: CooliconsIcon.house01,
              activeIconAsset: 'assets/icons/home_fill.svg',
              label: '홈',
              isActive: currentIndex == 0,
              onTap: () => onIndexChanged(0),
            ),
            const SizedBox(width: 60),
            _NavItem(
              icon: CooliconsIcon.fileAdd,
              iconAsset: 'assets/icons/file_add.svg',
              activeIcon: CooliconsIcon.fileAdd,
              activeIconAsset: 'assets/icons/file_add.svg',
              label: '계약 작성',
              isActive: currentIndex == 1,
              onTap: () async {
                onIndexChanged(1);

                isMinor
                    ? showDialog(
                        barrierColor: Colors.black.withValues(alpha: 0.75),
                        context: context,
                        builder: (context) =>
                            const GuardianConsentSignDialog(isCreator: true),
                      )
                    : context.push(AppRoutes.selectRole);
              },
            ),
            const SizedBox(width: 60),
            _NavItem(
              icon: CooliconsIcon.user01,
              activeIcon: CooliconsIcon.user01,
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
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.iconAsset,
    this.activeIconAsset,
  });

  final IconData icon;
  final String? iconAsset;
  final IconData activeIcon;
  final String? activeIconAsset;
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
              if (isActive && activeIconAsset != null)
                SvgPicture.asset(
                  activeIconAsset!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
                )
              else if (!isActive && iconAsset != null)
                SvgPicture.asset(
                  iconAsset!,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
                )
              else
                Icon(isActive ? activeIcon : icon, color: itemColor, size: 24),
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
