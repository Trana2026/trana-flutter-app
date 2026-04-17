import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/auth/presentation/screens/guardian_waiting/guardian_verify_waiting_page.dart';
import 'package:trana/core/widgets/primary_button.dart';

class GuardianLinkSendPage extends HookConsumerWidget {
  const GuardianLinkSendPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold"
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
                  fontFamily: "PretendardBold"
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
                      "링크 예정",
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontSize: 14,
                        fontFamily: "PretendardRegular"
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
                      Clipboard.setData(
                        const ClipboardData(text: "trana.app/verify/123456789"),
                      );
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
                      "링크 전달 후, 보호자가 인증을 완료할 때까지 기다려주세요",
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 12.5,
                        fontFamily: "PretendardRegular",
                        letterSpacing: -0.2
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
        child: PrimaryButton(
          text: "인증 요청 보내기",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GuardianVerifyWaitingPage(),
              ),
            );
          },
          backgroundColor: fxc(context).brandColor!,
          foregroundColor: fxc(context).textBrand!,
        ),
      ),
    );
  }
}