import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/home_page/widgets/home_bottom_nav.dart';
import 'package:trana/view/authenticated/home_page/widgets/home_main_view.dart';
import 'package:trana/view/authenticated/my_page/my_page.dart';
import 'package:trana/view/modal/ai_autofill_notice_dialog/ai_autofill_notice_dialog.dart';
import 'package:trana/view/modal/guardian_identity_verify_dialog/guardian_identity_verify_dialog.dart';

class HomePage extends HookConsumerWidget {
  final bool showGuardianDialog;
  const HomePage({super.key, this.showGuardianDialog = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState<int>(0);

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

    final pages = [
      const HomeMainView(),
      const HomeMainView(),
      const MyPage(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: vrc(context).background,

      /// 🔥 body를 Stack으로 감싸기 (이거만 핵심 변경)
      body: Stack(
        children: [
          /// 🔥 기존 IndexedStack 유지
          IndexedStack(
            index: currentIndex.value,
            children: pages,
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
                  currentIndex.value = 1;
                  showDialog(
                    context: context,
                    barrierColor: Colors.black
                        .withValues(alpha: 0.75),
                    builder: (context) =>
                        const AiAutofillNoticeDialog(),
                  ).then((context) {
                    currentIndex.value = 0;
                  });
                },
              },
            ),
          ),
        ],
      ),
    );
  }
}