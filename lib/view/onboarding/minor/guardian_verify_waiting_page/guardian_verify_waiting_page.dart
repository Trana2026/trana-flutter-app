import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/home_page/home_page.dart';
import 'package:trana/widgets/primary_button.dart';

class GuardianVerifyWaitingPage extends HookConsumerWidget {
  const GuardianVerifyWaitingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleted = useState(false);
    final currentStep = useState(2);

    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        isCompleted.value = true;
        currentStep.value = 3;
      });
      return null;
    }, const []);

    const int totalStep = 3;
    final double progress = currentStep.value / totalStep;
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
            fontWeight: FontWeight.w800,
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
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                isCompleted.value ? "인증 완료!" : "인증 진행 중...",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                isCompleted.value
                    ? "이제 법정대리인의 동의 하에\n안전하게 계약을 생성할 수 있어요."
                    : "보호자분께서 본인 인증을 진행하고 있어요.\n완료되면 알림을 보내드릴게요.",
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Align(
                alignment: const Alignment(0, -0.1),
                child: isCompleted.value
                    ? Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: fxc(context).subtitleGreen,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          color: fxc(context).brandColor,
                          size: 46,
                        ),
                      )
                    : CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          fxc(context).brandColor!,
                        ),
                        strokeWidth: 4.5,
                      ),
              ),
            ),
            PrimaryButton(
              text: "완료",
              onTap: isCompleted.value
                  ? () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    }
                  : null,
              backgroundColor: isCompleted.value
                  ? fxc(context).brandColor!
                  : vrc(context).disableColor!,
              foregroundColor: isCompleted.value
                  ? fxc(context).textBrand!
                  : vrc(context).textDisable!,
            ),
          ],
        ),
      ),
    );
  }
}
