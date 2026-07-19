import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/ekyc/presentation/viewmodels/terms_view_model.dart';
import 'package:trana/features/profile/domain/entities/user_consent_entity.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyDetailPage extends HookConsumerWidget {
  /// 마이페이지 약관 상세
  const PolicyDetailPage({super.key, required UserConsentEntity consent})
    : _consent = consent,
      _directUrl = null,
      _directTitle = null;

  /// 온보딩 약관 전문
  const PolicyDetailPage.url({
    super.key,
    required String url,
    required String title,
  }) : _directUrl = url,
       _directTitle = title,
       _consent = null;

  final UserConsentEntity? _consent;
  final String? _directUrl;
  final String? _directTitle;

  // const PolicyDetailPage({super.key, required this.type});

  // final TermsType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: 백엔드 GET /v1/terms/{type} 구현되면 변경
    // final termsState = ref.watch(termDetailViewModelProvider);
    // final termsVM = ref.read(termDetailViewModelProvider.notifier);

    // final title = termsState.title;
    // final url = termsState.contentUrl;
    // final isLoadingTerm = termsState.isLoadingTerm;

    // useEffect(() {
    //   WidgetsBinding.instance.addPostFrameCallback((_) async {
    //     // 타입별 약관 단일 조회
    //     final success = await termsVM.readTermByType(type);
    //     if (!context.mounted) return;
    //     if (!success) {
    //       final state = ref.read(termDetailViewModelProvider);
    //       showErrorToast(context, state.error!);
    //       termsVM.clearError();
    //     }
    //   });
    //   return null;
    // }, []);

    final termsAsync = ref.watch(termsViewModelProvider);

    final consent = _consent;
    final title = consent?.title ?? _directTitle ?? '';
    final url =
        _directUrl ??
        (consent == null
            ? null
            : termsAsync.value
                  ?.where((t) => t.id == consent.termsId)
                  .firstOrNull
                  ?.contentUrl);

    // final term = termsAsync.value
    //     ?.where((t) => t.type == type.apiString)
    //     .firstOrNull;
    // final title = term?.title ?? '';
    // final url = term?.contentUrl ?? '';

    final controller = useMemoized(
      () => WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted),
    );

    useEffect(() {
      if (url != null) controller.loadRequest(Uri.parse(url));
      return null;
    }, [url]);

    // useEffect(() {
    //   if (url.isNotEmpty) controller.loadRequest(Uri.parse(url));
    //   return null;
    // }, [url]);

    return Scaffold(
      backgroundColor: vrc(context).secondaryColor,
      appBar: CustomAppBar.leading(
        title: title,
        onTapLeading: () => context.pop(),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: vrc(context).background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              offset: Offset.zero,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: WebViewWidget(controller: controller),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton.brand(text: "확인", onTap: () => context.pop()),
        ),
      ),
    );
  }
}
