import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/presentation/widgets/modals/guardian_identity_verify_dialog.dart';
import 'package:trana/features/profile/presentation/providers/test_user_provider.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_bottom_nav.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_sign_request_banner.dart';
import 'package:trana/features/profile/presentation/screens/home/widgets/home_main_view.dart';
import 'package:trana/features/profile/presentation/screens/my_page/my_page.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class HomePage extends HookConsumerWidget {
  final bool showGuardianDialog;
  const HomePage({super.key, this.showGuardianDialog = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVM = ref.read(homeContractViewModelProvider.notifier);
    final currentIndex = useState<int>(0);

    final homeState = ref.watch(homeContractViewModelProvider);
    final hasSharedContract = homeState.myContracts.any(
      (c) => c.status == ContractStatus.shared && !c.isCreator,
    );

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

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // TODO : 테스트용 유저 변경 (로그인)
        final userVM = ref.read(testUserProvider.notifier);
        await userVM.login();

        final success = await homeVM.readMyContracts();
        if (!context.mounted) return;
        if (!success) {
          showErrorToast(
            context,
            ref.read(homeContractViewModelProvider).error!,
          );
          homeVM.clearError();
          return;
        }
      });
      return null;
    }, []);

    final pages = [const HomeMainView(), const MyPage(), const HomeMainView()];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: vrc(context).secondaryColor,
      body: Stack(
        children: [
          IndexedStack(index: currentIndex.value, children: pages),

          // 서명 요청 수신 배너
          if (hasSharedContract)
            const AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeOut,
              left: 20,
              right: 20,
              bottom: 110,
              child: HomeSignRequestBanner(),
            ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HomeBottomNav(
              currentIndex: currentIndex.value,
              onIndexChanged: (index) => currentIndex.value = index,
            ),
          ),
        ],
      ),
    );
  }
}
