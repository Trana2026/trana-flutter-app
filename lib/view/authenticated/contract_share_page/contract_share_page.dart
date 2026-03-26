import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_detail_page/contract_draft_page.dart';
import 'package:trana/view/authenticated/home_page/home_page.dart';
import 'package:trana/widgets/contract_form_field.dart';
import 'package:trana/widgets/primary_button.dart';

class ContractSharePage extends HookConsumerWidget {
  const ContractSharePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();

    return Scaffold(
      backgroundColor: vrc(context).background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "계약서 공유하기",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1.5),
                  child: Text(
                    "계약서를 공유하세요",
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
                    "초안을 확인하고 카카오톡으로 공유하세요",
                    style: TextStyle(
                      color: vrc(context).textSecondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                Container(
                  width: double.infinity,
                  height: 180,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: fxc(context).subtitleBlue,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "계약서 전문 보기",
                    style: TextStyle(
                      color: vrc(context).textTertiary,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 전송 채널 라벨
                Padding(
                  padding: const EdgeInsets.only(left: 1.5),
                  child: Text(
                    "전송 채널",
                    style: TextStyle(
                      color: vrc(context).textSecondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: fxc(context).subtitleKakao,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: fxc(context).borderKakao!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.chat_bubble_rounded, size: 22),
                      const SizedBox(width: 8),
                      Text(
                        "카카오톡",
                        style: TextStyle(
                          color: vrc(context).textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                ContractFormField(
                  label: "이름",
                  hintText: "거래 상대방의 이름을 입력해주세요",
                  controller: nameController,
                ),
                const SizedBox(height: 16),

                ContractFormField(
                  label: "연락처",
                  hintText: "010-0000-0000",
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: PrimaryButton(
                text: "취소",
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                },
                backgroundColor: vrc(context).secondaryColor!,
                foregroundColor: vrc(context).textPrimary!,
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              flex: 7,
              child: PrimaryButton(
                text: "카카오톡으로 요청하기",
                onTap: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          fxc(context).brandColor!,
                        ),
                        strokeWidth: 4.5,
                      ),
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 1));
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContractDraftPage(),
                      ),
                      (route) => false,
                    );
                  }
                },
                backgroundColor: fxc(context).brandColor!,
                foregroundColor: fxc(context).textBrand!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
