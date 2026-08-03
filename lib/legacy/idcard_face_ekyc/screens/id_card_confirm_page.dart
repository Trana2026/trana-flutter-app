import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/constants/app_durations.dart';
import 'package:trana/core/constants/app_dimens.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/presentation/viewmodels/adult_kyc_view_model.dart';

/// 신분증 OCR 결과 확인 및 수정 화면
class IdCardConfirmPage extends HookConsumerWidget {
  const IdCardConfirmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adultKycViewModelProvider); // auto-dispose 방지

    const currentStep = 3;
    const totalStep = 5;
    final s = context.designScale;

    final nameController = useTextEditingController();
    final birthController = useTextEditingController();
    final phoneController = useTextEditingController();
    final isLoading = useState(false);
    final phoneError = useState<String?>(null);

    // OCR 결과로 이름,생년월일 자동 채우기
    useEffect(() {
      final ocrResult = ref.read(adultKycViewModelProvider).ocrResult;
      if (ocrResult != null) {
        nameController.text = ocrResult.name;
        birthController.text = ocrResult.birthDate;
      }
      return null;
    }, const []);

    Future<void> submit() async {
      // 전화번호 클라이언트 검증
      final digits = phoneController.text.replaceAll(RegExp(r'\D'), '');
      if (digits.length != 11) {
        phoneError.value = "올바른 전화번호를 입력해 주세요";
        return;
      }
      phoneError.value = null;
      isLoading.value = true;

      // 진위확인
      final verifyResult = await ref
          .read(adultKycViewModelProvider.notifier)
          .verifyIdCard();

      if (!context.mounted) {
        isLoading.value = false;
        return;
      }
      if (verifyResult case Failure(:final failure)) {
        isLoading.value = false;
        _showConfirmError(context, failure);
        return;
      }

      // 전화번호 기록
      final phoneResult = await ref
          .read(adultKycViewModelProvider.notifier)
          .submitPhone(phone: phoneController.text);

      isLoading.value = false;
      if (!context.mounted) return;

      switch (phoneResult) {
        case Success():
          context.push(AppRoutes.faceVerify);
        case Failure(:final failure):
          _showConfirmError(context, failure);
      }
    }

    return Scaffold(
      backgroundColor: vrc(context).background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: vrc(context).background,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20 * s,
            color: vrc(context).iconPrimary,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 16 * s,
            fontFamily: "PretendardBold",
            letterSpacing: -0.16 * s,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4 * s),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: AppDurations.expand,
              height: 4 * s,
              width:
                  MediaQuery.sizeOf(context).width * (currentStep / totalStep),
              color: fxc(context).brandColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      20 * s,
                      24 * s,
                      20 * s,
                      16 * s,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "정보 확인",
                          style: TextStyle(
                            color: vrc(context).textPrimary,
                            fontSize: 20 * s,
                            fontFamily: "PretendardBold",
                            letterSpacing: -0.20 * s,
                          ),
                        ),
                        SizedBox(height: 6 * s),
                        Text(
                          "스캔된 신분증 정보를 확인해 주세요.",
                          style: TextStyle(
                            color: vrc(context).textSecondary,
                            fontSize: 14 * s,
                            fontFamily: "PretendardMedium",
                            letterSpacing: -0.14 * s,
                          ),
                        ),
                        SizedBox(height: 24 * s),

                        // 촬영한 신분증 이미지
                        _IdCardImage(
                          scale: s,
                          imagePath: state.idCardImagePath,
                        ),
                        SizedBox(height: 24 * s),

                        _ConfirmField(
                          scale: s,
                          label: "이름",
                          hint: "홍길동",
                          controller: nameController,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 7 * s),
                        _ConfirmField(
                          scale: s,
                          label: "생년월일",
                          hint: "1990-01-01",
                          controller: birthController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [_DateFormatter()],
                        ),
                        SizedBox(height: 7 * s),
                        _ConfirmField(
                          scale: s,
                          label: "전화번호",
                          hint: "010-1234-5678",
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [_PhoneFormatter()],
                          errorText: phoneError.value,
                          onChanged: (_) {
                            if (phoneError.value != null) {
                              phoneError.value = null;
                            }
                          },
                        ),

                        // 폼과 버튼 사이 여백 (공간이 남으면 버튼을 하단으로 밀어냄)
                        SizedBox(height: 24 * s),
                        const Spacer(),

                        _ConfirmButton(
                          scale: s,
                          text: "다시 촬영하기",
                          color: vrc(context).secondaryColor!,
                          textColor: vrc(context).textPrimary!,
                          onTap: isLoading.value ? null : () => context.pop(),
                        ),
                        SizedBox(height: 10 * s),
                        _ConfirmButton(
                          scale: s,
                          text: isLoading.value ? "처리 중..." : "정보 확인 완료",
                          color: fxc(context).brandColor!,
                          textColor: fxc(context).textBrand!,
                          onTap: isLoading.value ? null : submit,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 촬영한 신분증 이미지 미리보기
class _IdCardImage extends StatelessWidget {
  const _IdCardImage({required this.scale, required this.imagePath});

  final double scale;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    final hasImage = imagePath != null && File(imagePath!).existsSync();
    return Container(
      width: double.infinity,
      height: 218 * s,
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(20 * s),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.5 * s, vertical: 12.5 * s),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12 * s),
          child: hasImage
              ? Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Center(
                  child: Icon(
                    Icons.credit_card,
                    size: 48 * s,
                    color: vrc(context).iconDisable,
                  ),
                ),
        ),
      ),
    );
  }
}

/// 레이블 + 입력 박스
class _ConfirmField extends StatelessWidget {
  const _ConfirmField({
    required this.scale,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.errorText,
    this.onChanged,
  });

  final double scale;
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    final hasError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6 * s),
          child: Text(
            label,
            style: TextStyle(
              color: vrc(context).textTertiary,
              fontSize: 14 * s,
              fontFamily: "PretendardMedium",
              letterSpacing: -0.14 * s,
            ),
          ),
        ),
        SizedBox(height: 4 * s),
        Container(
          height: 53 * s,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 14 * s),
          decoration: BoxDecoration(
            color: vrc(context).secondaryColor,
            borderRadius: BorderRadius.circular(16 * s),
            // 오류 시 빨간 테두리
            border: Border.all(
              color: hasError ? const Color(0xFFEF4444) : Colors.transparent,
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            cursorColor: fxc(context).brandColor,
            style: TextStyle(
              color: vrc(context).textPrimary,
              fontSize: 14 * s,
              fontFamily: "PretendardMedium",
              letterSpacing: -0.14 * s,
            ),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: vrc(context).textDisable,
                fontSize: 14 * s,
                fontFamily: "PretendardMedium",
                letterSpacing: -0.14 * s,
              ),
            ),
          ),
        ),
        // 오류 시 도움말 메시지
        if (hasError) ...[
          SizedBox(height: 6 * s),
          Padding(
            padding: EdgeInsets.only(left: 2 * s),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 14 * s,
                  color: const Color(0xFFEF4444),
                ),
                SizedBox(width: 6 * s),
                Text(
                  errorText!,
                  style: TextStyle(
                    color: const Color(0xFFEF4444),
                    fontSize: 12 * s,
                    fontFamily: "PretendardMedium",
                    letterSpacing: -0.12 * s,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

/// 하단 액션 버튼. 다시 촬영하기 버튼 & 정보 확인 완료 버튼
class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({
    required this.scale,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  final double scale;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(16 * s),
      child: InkWell(
        borderRadius: BorderRadius.circular(16 * s),
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 52 * s,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16 * s,
                fontFamily: "PretendardSemiBold",
                letterSpacing: -0.16 * s,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showConfirmError(BuildContext context, AppFailure failure) {
  final message = switch (failure) {
    VerifyFailure() => '신분증 진위확인에 실패했습니다. 다시 촬영해주세요.',
    SessionExpiredFailure(:final isSignupSession) =>
      isSignupSession
          ? '인증 세션이 만료되었습니다. 처음부터 다시 시작해주세요.'
          : 'OCR 세션이 만료되었습니다. 신분증을 다시 촬영해주세요.',
    _ => '오류가 발생했습니다. 다시 시도해주세요.',
  };
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

  if (failure case SessionExpiredFailure(:final isSignupSession)) {
    if (isSignupSession) {
      context.go(AppRoutes.terms);
    } else {
      context.go(AppRoutes.idCardCamera);
    }
  }
}

/// 생년월일 입력을 YYYY-MM-DD 형식으로 자동 포맷
class _DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digits.length > 8 ? digits.substring(0, 8) : digits;
    final buffer = StringBuffer();
    for (int i = 0; i < limited.length; i++) {
      if (i == 4 || i == 6) buffer.write('-');
      buffer.write(limited[i]);
    }
    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

/// 전화번호 입력을 010-XXXX-XXXX 형식으로 자동 포맷
class _PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digits.length > 11 ? digits.substring(0, 11) : digits;
    final buffer = StringBuffer();
    for (int i = 0; i < limited.length; i++) {
      if (i == 3 || i == 7) buffer.write('-');
      buffer.write(limited[i]);
    }
    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
