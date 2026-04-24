import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/auth/presentation/screens/face_verify/face_verify_page.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/primary_button.dart';

class IdCardConfirmPage extends HookConsumerWidget {
  const IdCardConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const int currentStep = 3;
    const int totalStep = 5;

    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    final nameController = useTextEditingController();
    final birthController = useTextEditingController();
    final phoneController = useTextEditingController();

    return Scaffold(
      backgroundColor: vrc(context).background,
      resizeToAvoidBottomInset: true,
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1.5),
                  child: Text(
                    "정보 확인",
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
                    "스캔된 신분증 정보를 확인해주세요",
                    style: TextStyle(
                      color: vrc(context).textSecondary,
                      fontSize: 15,
                      fontFamily: "PretendardMedium"
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: fxc(context).subtitleGreen,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: fxc(context).subtitleGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.circle,
                            color: fxc(context).brandColor,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Text(
                          "신분증 인식이 완료되었습니다\n아래 정보가 정확한지 확인하여 주세요",
                          style: TextStyle(
                            color: fxc(context).brandColor,
                            fontSize: 13,
                            fontFamily: "PretendardMedium"
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                ContractFormField(
                  label: "이름", 
                  hintText: "권태윤",
                  controller: nameController,
                ),
                const SizedBox(height: 16),

                ContractFormField(
                  label: "생년월일", 
                  hintText: "2003/06/23",
                  controller: birthController,
                ),
                const SizedBox(height: 16),

                ContractFormField(
                  label: "전화번호",
                  hintText: "010-7323-2931",
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: PrimaryButton(
          text: "정보 확인 완료",
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FaceVerifyPage()),
          ),
          backgroundColor: fxc(context).brandColor!,
          foregroundColor: fxc(context).textBrand!,
        ),
      ),
    );
  }
}
