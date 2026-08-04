import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/terms/domain/entities/terms_entity.dart';
import 'package:trana/features/terms/presentation/viewmodels/terms_view_model.dart';

/// 약관 동의 항목
enum _ConsentItem {
  service('[필수] 서비스 이용약관', true, 'SERVICE'),
  privacy('[필수] 개인정보 수집·이용 동의', true, 'PRIVACY'),
  thirdParty('[필수] 개인정보 제3자 제공 동의', true, 'THIRD_PARTY'),
  marketing('[선택] 마케팅 정보 수신 동의', false, 'MARKETING');

  const _ConsentItem(this.label, this.required, this.termsType);

  final String label;
  final bool required;
  final String termsType;
}

/// 약관 동의 바텀시트
class TermsAgreementBottomSheet extends HookConsumerWidget {
  const TermsAgreementBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termsAsync = ref.watch(termsViewModelProvider);
    final terms = termsAsync.value ?? const <TermsEntity>[];

    final checked = useState(<_ConsentItem>{});
    final isLoading = useState(false);

    useEffect(() {
      // modal_viewed: 약관 동의 바텀시트
      AnalyticsService.trackScreenView(
        'terms_agreement_modal',
        entryPoint: 'intro',
      );
      return null;
    }, const []);

    // 서버에서 약관 id가 조회되는 필수 항목만 버튼 활성화 조건에 포함
    final resolvableRequired = _ConsentItem.values
        .where((e) => e.required && _termsOf(terms, e) != null)
        .toSet();
    final allItems = _ConsentItem.values.toSet();
    final isAllChecked = checked.value.length == allItems.length;
    final canSubmit =
        !isLoading.value &&
        resolvableRequired.isNotEmpty &&
        resolvableRequired.every(checked.value.contains);

    void toggleAll() {
      checked.value = isAllChecked ? <_ConsentItem>{} : {...allItems};
    }

    void toggle(_ConsentItem item) {
      final next = {...checked.value};
      next.contains(item) ? next.remove(item) : next.add(item);
      checked.value = next;
    }

    void openDetail(TermsEntity? term) {
      if (term == null) return;
      context.push(AppRoutes.termsDetail, extra: term.id);
    }

    Future<void> submit() async {
      final termIds = checked.value
          .map((e) => _termsOf(terms, e)?.id)
          .whereType<int>()
          .toList();
      if (termIds.isEmpty) return;

      final router = GoRouter.of(context);
      final messenger = ScaffoldMessenger.of(context);

      isLoading.value = true;
      final signupSessionId = await ref
          .read(termsViewModelProvider.notifier)
          .submitConsent(termsVersionIds: termIds);
      isLoading.value = false;

      if (!context.mounted) return;

      if (signupSessionId == null) {
        messenger.showSnackBar(
          const SnackBar(content: Text('약관 동의에 실패했습니다. 다시 시도해주세요.')),
        );
        return;
      }

      // EVT-006: terms_consent_submitted
      AnalyticsService.track(
        'terms_consent_submitted',
        properties: {
          'required_terms_accepted': resolvableRequired.every(
            checked.value.contains,
          ),
          'marketing_consent': checked.value.contains(
            _ConsentItem.marketing,
          ),
        },
      );

      Navigator.of(context).pop();
      router.push(AppRoutes.passVerify, extra: signupSessionId);
    }

    return Container(
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: vrc(context).disableColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 모든 약관 동의
              _AllAgreeRow(checked: isAllChecked, onTap: toggleAll),
              const SizedBox(height: 12),

              // 항목별 동의
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  color: vrc(context).secondaryColor,
                  child: Column(
                    children: [
                      for (var i = 0; i < _ConsentItem.values.length; i++)
                        _ConsentRow(
                          label: _ConsentItem.values[i].label,
                          checked: checked.value.contains(
                            _ConsentItem.values[i],
                          ),
                          onToggle: () => toggle(_ConsentItem.values[i]),
                          onOpenDetail: () => openDetail(
                            _termsOf(terms, _ConsentItem.values[i]),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // 개인정보 처리방침 보기
              _PrivacyPolicyRow(
                onTap: () => openDetail(_termsOf(terms, _ConsentItem.privacy)),
              ),
              const SizedBox(height: 20),

              _ConfirmButton(
                enabled: canSubmit,
                loading: isLoading.value,
                onTap: submit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 동의 항목에 대응하는 약관 조회
  static TermsEntity? _termsOf(List<TermsEntity> terms, _ConsentItem item) =>
      terms.where((t) => t.type == item.termsType).firstOrNull;
}

/// 모든 약관 동의
class _AllAgreeRow extends StatelessWidget {
  const _AllAgreeRow({required this.checked, required this.onTap});

  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: vrc(context).secondaryColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Row(
            children: [
              _CheckBox(checked: checked),
              const SizedBox(width: 12),
              Text(
                '약관 모두 동의',
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 15,
                  fontFamily: 'PretendardBold',
                  letterSpacing: -0.15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 항목별 약관 동의
class _ConsentRow extends StatelessWidget {
  const _ConsentRow({
    required this.label,
    required this.checked,
    required this.onToggle,
    required this.onOpenDetail,
  });

  final String label;
  final bool checked;
  final VoidCallback onToggle;
  final VoidCallback onOpenDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 13, 8, 13),
              child: Row(
                children: [
                  _CheckBox(checked: checked, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 14,
                        fontFamily: 'PretendardMedium',
                        letterSpacing: -0.14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: onOpenDetail,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 13, 15, 13),
            child: Icon(
              CooliconsIcon.chevronRight,
              size: 20,
              color: vrc(context).iconSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

/// 개인정보 처리방침 보기
class _PrivacyPolicyRow extends StatelessWidget {
  const _PrivacyPolicyRow({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: vrc(context).secondaryColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '개인정보 처리방침 보기',
                  style: TextStyle(
                    color: vrc(context).textSecondary,
                    fontSize: 14,
                    fontFamily: 'PretendardMedium',
                    letterSpacing: -0.14,
                  ),
                ),
              ),
              Icon(
                CooliconsIcon.chevronRight,
                size: 20,
                color: vrc(context).iconSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 라운드 사각형 체크박스
class _CheckBox extends StatelessWidget {
  const _CheckBox({required this.checked, this.size = 22});

  final bool checked;
  final double size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: checked ? fxc(context).brandColor : vrc(context).background,
        borderRadius: BorderRadius.circular(7),
        border: checked
            ? null
            : Border.all(color: vrc(context).borderSecondary!, width: 1.5),
      ),
      child: checked
          ? Icon(Icons.check, size: size * 0.62, color: fxc(context).textBrand)
          : null,
    );
  }
}

/// 확인 버튼
class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton({
    required this.enabled,
    required this.loading,
    required this.onTap,
  });

  final bool enabled;
  final bool loading;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: enabled ? fxc(context).brandColor : vrc(context).disableColor,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: enabled ? onTap : null,
        child: SizedBox(
          height: 54,
          child: Center(
            child: Text(
              loading ? '처리 중...' : '확인',
              style: TextStyle(
                color: enabled
                    ? fxc(context).textBrand
                    : vrc(context).textDisable,
                fontSize: 16,
                fontFamily: 'PretendardSemiBold',
                letterSpacing: -0.16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
