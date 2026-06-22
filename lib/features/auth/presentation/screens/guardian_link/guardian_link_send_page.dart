import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/guardian/presentation/viewmodels/guardian_view_model.dart';

/// 대리인 인증 딥링크를 전달하는 화면
class GuardianLinkSendPage extends HookConsumerWidget {
  const GuardianLinkSendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guardianLink = useState<String?>(null);
    final copied = useState<bool>(false);

    useEffect(() {
      Future(() async {
        final link = await ref
            .read(guardianViewModelProvider.notifier)
            .createLink();
        guardianLink.value = link;
      });
      return null;
    }, const []);

    const int currentStep = 1;
    const int totalStep = 3;

    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "법정대리인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold",
          ),
        ),
        backgroundColor: vrc(context).background,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: barWidth,
              color: fxc(context).brandColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "보호자에게 링크 보내기",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontFamily: "PretendardBold",
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "아래 링크를 복사하여 법정대리인께 전달해주세요.\n완료되면 알림을 보내드릴게요.",
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium",
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: vrc(context).secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      guardianLink.value ?? "링크 생성 중...",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontSize: 14,
                        fontFamily: "PretendardRegular",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      if (guardianLink.value == null) return;
                      Clipboard.setData(
                        ClipboardData(text: guardianLink.value ?? ''),
                      );
                      copied.value = true;
                      Fluttertoast.showToast(
                        msg: "링크가 복사되었습니다",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: vrc(context).secondaryColor!,
                        textColor: vrc(context).textPrimary!,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: vrc(context).secondaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.copy_rounded,
                        color: fxc(context).brandColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: vrc(context).iconSecondary,
                    size: 25,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "링크를 복사해, 법정대리인에게 전달해주세요",
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 12.5,
                        fontFamily: "PretendardRegular",
                        letterSpacing: -0.2,
                        // height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 복사 완료 시 안내 배너
            if (copied.value) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: vrc(context).secondaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: fxc(context).brandColor,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "링크 복사가 완료되었어요!",
                            style: TextStyle(
                              color: vrc(context).textSecondary,
                              fontSize: 14,
                              fontFamily: "PretendardBold",
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "복사한 링크를 법정대리인분께 전달해주세요",
                            style: TextStyle(
                              color: vrc(context).textTertiary,
                              fontSize: 12,
                              fontFamily: "PretendardMedium",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
            // 복사 전 비활성. 복사 후 활성
            PrimaryButton(
              text: "홈으로 돌아가기",
              onTap: () {
                // 홈 화면 이동
                if (!copied.value) return;
                context.go(AppRoutes.home);
              },
              backgroundColor: copied.value
                  ? fxc(context).brandColor!
                  : vrc(context).disableColor!,
              foregroundColor: copied.value
                  ? fxc(context).textBrand!
                  : vrc(context).textDisable!,
            ),
          ],
        ),
      ),
    );
  }
}
