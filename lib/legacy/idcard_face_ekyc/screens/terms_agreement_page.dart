import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/constants/app_dimens.dart';
import 'package:trana/core/constants/app_durations.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/terms/presentation/viewmodels/terms_view_model.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/presentation/viewmodels/adult_kyc_view_model.dart';

/// 약관 미리보기에 표시되는 항목
const _termSections = [
  ("1. 목적", "Trana는 개인 간의 안전한 물품 거래를 돕기 위해 전자 계약 서비스를 제공합니다."),
  ("2. 본인 인증", "신원 확인을 위해 신분증 OCR 스캔 및 안면 인식 정보 수집에 동의합니다."),
  ("3. 개인정보 보호", "귀하의 개인정보는 암호화되어 저장되며, 제3자에게 판매되지 않습니다."),
  ("4. 책임의 한계", "Trana는 거래 당사자 간의 계약 내용에 대해 직접적인 책임을 지지 않습니다..."),
];

/// 서비스 이용약관 동의 화면
class TermsAgreementPage extends HookConsumerWidget {
  const TermsAgreementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termsAsync = ref.watch(termsViewModelProvider);
    final agreed = useState(false);
    final isLoading = useState(false);

    const currentStep = 1;
    const totalStep = 5;
    final scale = context.designScale;

    Future<void> submit() async {
      final termIds = termsAsync.value?.map((e) => e.id).toList();
      if (termIds == null || termIds.isEmpty) return;

      isLoading.value = true;
      final signupSessionId = await ref
          .read(termsViewModelProvider.notifier)
          .submitConsent(termsVersionIds: termIds);
      isLoading.value = false;

      if (!context.mounted) return;

      if (signupSessionId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('약관 동의에 실패했습니다. 다시 시도해주세요.')),
        );
        return;
      }

      ref
          .read(adultKycViewModelProvider.notifier)
          .setSignupSessionId(signupSessionId);
      ref.read(authTokenStoreProvider); // 초기화 보장
      context.push(AppRoutes.idCardCamera);
    }

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: vrc(context).background,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20 * scale,
            color: vrc(context).iconPrimary,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 16 * scale,
            fontFamily: "PretendardBold",
            letterSpacing: -0.16 * scale,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4 * scale),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: AppDurations.expand,
              height: 4 * scale,
              width:
                  MediaQuery.sizeOf(context).width * (currentStep / totalStep),
              color: fxc(context).brandColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20 * scale, 24 * scale, 20 * scale, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "서비스 이용 약관",
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 20 * scale,
                fontFamily: "PretendardBold",
                letterSpacing: -0.20 * scale,
              ),
            ),
            SizedBox(height: 6 * scale),
            Text(
              "원활한 서비스 이용을 위해 약관에 동의해 주세요.",
              style: TextStyle(
                color: vrc(context).textSecondary,
                fontSize: 14 * scale,
                fontFamily: "PretendardMedium",
                letterSpacing: -0.14 * scale,
              ),
            ),
            SizedBox(height: 20 * scale),
            _PreviewCard(scale: scale),
            SizedBox(height: 12 * scale),
            Center(
              child: Text(
                "전문 보기",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 12 * scale,
                  fontFamily: "PretendardBold",
                  letterSpacing: -0.12 * scale,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20 * scale, 0, 20 * scale, 16 * scale),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AgreeCheckRow(
              scale: scale,
              checked: agreed.value,
              onTap: () => agreed.value = !agreed.value,
            ),
            SizedBox(height: 10 * scale),
            _StartButton(
              scale: scale,
              enabled: agreed.value && !isLoading.value,
              loading: isLoading.value,
              onTap: submit,
            ),
          ],
        ),
      ),
    );
  }
}

/// 약관 미리보기 카드
class _PreviewCard extends StatelessWidget {
  const _PreviewCard({required this.scale});

  final double scale;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18 * s).copyWith(top: 24 * s, bottom: 24 * s),
      decoration: BoxDecoration(
        color: vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(18 * s),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < _termSections.length; i++) ...[
            if (i > 0) SizedBox(height: 24 * s),
            Text(
              _termSections[i].$1,
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 14 * s,
                fontFamily: "PretendardBold",
                letterSpacing: -0.14 * s,
              ),
            ),
            SizedBox(height: 12 * s),
            Text(
              _termSections[i].$2,
              style: TextStyle(
                color: vrc(context).textSecondary,
                fontSize: 12 * s,
                fontFamily: "PretendardMedium",
                height: 1.5,
                letterSpacing: -0.12 * s,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// 전체 약관 동의 체크 행
class _AgreeCheckRow extends StatelessWidget {
  const _AgreeCheckRow({
    required this.scale,
    required this.checked,
    required this.onTap,
  });

  final double scale;
  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Material(
      color: vrc(context).secondaryColor,
      borderRadius: BorderRadius.circular(16 * s),
      child: InkWell(
        borderRadius: BorderRadius.circular(16 * s),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14 * s, vertical: 16 * s),
          child: Row(
            children: [
              Container(
                width: 20 * s,
                height: 20 * s,
                // 체크 처리
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: checked
                      ? fxc(context).brandColor
                      : vrc(context).secondaryColor,
                  border: checked
                      ? null
                      : Border.all(color: vrc(context).borderSecondary!),
                ),
                child: checked
                    ? Icon(
                        Icons.check,
                        size: 14 * s,
                        color: fxc(context).textBrand,
                      )
                    : null,
              ),
              SizedBox(width: 10 * s),
              Text(
                "모든 약관에 동의합니다.",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 14 * s,
                  fontFamily: "PretendardBold",
                  letterSpacing: -0.14 * s,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 본인 인증 시작 버튼
class _StartButton extends StatelessWidget {
  const _StartButton({
    required this.scale,
    required this.enabled,
    required this.loading,
    required this.onTap,
  });

  final double scale;
  final bool enabled;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Material(
      color: enabled ? fxc(context).brandColor : vrc(context).disableColor,
      borderRadius: BorderRadius.circular(16 * s),
      child: InkWell(
        borderRadius: BorderRadius.circular(16 * s),
        onTap: enabled ? onTap : null,
        child: SizedBox(
          height: 52 * s,
          child: Center(
            child: Text(
              loading ? "처리 중..." : "본인 인증 시작하기",
              style: TextStyle(
                color: enabled
                    ? fxc(context).textBrand
                    : vrc(context).textDisable,
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
