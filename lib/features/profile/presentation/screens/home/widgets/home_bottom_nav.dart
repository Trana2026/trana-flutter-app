import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_consent_sign_dialog.dart';

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
    final createState = ref.watch(createContractViewModelProvider);
    final createVM = ref.read(createContractViewModelProvider.notifier);

    return SafeArea(
      top: false,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  _NavItem(
                    icon: CooliconsIcon.house01,
                    activeIcon: CooliconsIcon.house01,
                    activeIconAsset: 'assets/icons/home_fill.svg',
                    label: '홈',
                    isActive: currentIndex == 0,
                    onTap: () => onIndexChanged(0),
                  ),
                  const SizedBox(width: 16),
                  _NavItem(
                    icon: CooliconsIcon.user01,
                    activeIcon: CooliconsIcon.user01,
                    label: '마이페이지',
                    isActive: currentIndex == 1,
                    onTap: () => onIndexChanged(1),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () async {
                () => onIndexChanged(2);

                final success = await createVM.createDraft();
                if (!context.mounted) return;
                if (!success) {
                  showErrorToast(
                    context,
                    ref.read(createContractViewModelProvider).error!,
                  );
                  createVM.clearError();
                  return;
                }

                switch (createState.consentType) {
                  case null:
                    return;
                  case ConsentType.notApplicable:
                    context.push(AppRoutes.selectRole);
                    return;
                  case ConsentType.guardianRequired:
                    showDialog(
                      barrierColor: Colors.black.withValues(alpha: 0.75),
                      context: context,
                      builder: (context) => const GuardianConsentSignDialog(),
                    );
                    return;
                }
              },
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: vrc(context).secondaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/file_add.svg',
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                        fxc(context).brandColor!,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '계약 작성',
                      style: context.txt(
                        color: fxc(context).brandColor,
                        fontSize: 10,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
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
    this.activeIconAsset,
  });

  final IconData icon;
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
