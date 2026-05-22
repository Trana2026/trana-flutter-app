import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/screens/select_role/select_user_role_page.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_request_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_identity_verify_dialog.dart';
import 'package:trana/features/profile/presentation/providers/current_user_provider.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_bottom_nav.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_contract_request_banner.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_main_view.dart';
import 'package:trana/features/profile/presentation/screens/my_page/my_page.dart';

class HomePage extends HookConsumerWidget {
  final bool showGuardianDialog;
  const HomePage({super.key, this.showGuardianDialog = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestState = ref.watch(contractRequestViewModelProvider);
    final currentUserId = ref.watch(currentUserProvider);
    final currentIndex = useState<int>(0);

    final hasPendingInvite =
        currentUserId == 2 && requestState.requests.isNotEmpty;

    useEffect(() {
      if (showGuardianDialog) {
        Future.microtask(() {
          if (context.mounted) {
            showDialog(
              barrierColor: Colors.black.withValues(alpha: 0.75),
              context: context,
              builder: (context) => const GuardianIdentityVerifyDialog(),
            );
          }
        });
      }
      return null;
    }, []);

    final pages = [const HomeMainView(), const HomeMainView(), const MyPage()];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: vrc(context).background,

      /// 🔥 body를 Stack으로 감싸기 (이거만 핵심 변경)
      body: Stack(
        children: [
          /// 🔥 기존 IndexedStack 유지
          IndexedStack(index: currentIndex.value, children: pages),

          if (hasPendingInvite)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              left: 20,
              right: 20,
              bottom: hasPendingInvite ? 110 : -120,
              child: IgnorePointer(
                ignoring: !hasPendingInvite,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: hasPendingInvite ? 1 : 0,
                  child: HomeContractRequestBanner(
                    request: requestState.requests.reduce(
                      (a, b) => a.createdAt.isBefore(b.createdAt) ? a : b,
                    ),
                  ),
                ),
              ),
            ),

          /// 🔥 바텀 네비 Positioned로 복구
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HomeBottomNav(
              currentIndex: currentIndex.value,
              onIndexChanged: (index) => currentIndex.value = index,
              customOnTaps: {
                1: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectUserRolePage(),
                    ),
                  );
                },
              },
            ),
          ),
        ],
      ),
    );
  }
}
