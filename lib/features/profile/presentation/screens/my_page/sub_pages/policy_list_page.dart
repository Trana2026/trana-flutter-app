import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/utils/date_time_extensions.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/profile/domain/entities/user_consent_entity.dart';
import 'package:trana/features/profile/presentation/viewmodels/user_consent_view_model.dart';

class PolicyListPage extends HookConsumerWidget {
  const PolicyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consentState = ref.watch(userConsentViewModelProvider);
    final consentVM = ref.read(userConsentViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // 본인 약관 동의 내역 조회
        final success = await consentVM.readConsents();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(userConsentViewModelProvider);
          showErrorToast(context, state.error!);
          consentVM.clearError();
        }
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "약관 및 정책",
        onTapLeading: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("트라나", style: context.txt(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(
                "약관 및 개인정보 처리 동의",
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "회원 필수 동의서",
                style: context.txt(
                  color: vrc(context).textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              consentState.consents.isEmpty
                  ? SizedBox(
                      height: 300,
                      child: Center(
                        child: Text("약관이 없어요", style: context.txt()),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemCount: consentState.consents.length,
                      itemBuilder: (_, i) =>
                          _PolicyListItem(consent: consentState.consents[i]),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PolicyListItem extends StatelessWidget {
  const _PolicyListItem({required this.consent});

  final UserConsentEntity consent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.policyDetail, extra: consent.type),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    consent.title,
                    style: context.txt(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    consent.agreedAt.toDotFormat,
                    style: context.txt(
                      color: vrc(context).textTertiary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              CooliconsIcon.caretRightSm,
              size: 20,
              color: vrc(context).iconDisable,
            ),
          ],
        ),
      ),
    );
  }
}
