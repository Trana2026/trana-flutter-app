import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/ekyc/presentation/viewmodels/terms_view_model.dart';
import 'package:trana/features/profile/domain/entities/user_consent_entity.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PolicyDetailPage extends HookConsumerWidget {
  const PolicyDetailPage({super.key, required this.consent});

  final UserConsentEntity consent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termsAsync = ref.watch(termsViewModelProvider);

    final url = termsAsync.value
        ?.where((t) => t.id == consent.termsId)
        .firstOrNull
        ?.contentUrl;

    final controller = useMemoized(
      () => WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted),
    );

    useEffect(() {
      if (url != null) controller.loadRequest(Uri.parse(url));
      return null;
    }, [url]);

    return Scaffold(
      backgroundColor: vrc(context).secondaryColor,
      appBar: CustomAppBar.leading(
        title: consent.title,
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
          child: PrimaryButton(
            text: "확인",
            onTap: () => context.pop(),
            backgroundColor: fxc(context).brandColor!,
            foregroundColor: fxc(context).textBrand!,
          ),
        ),
      ),
    );
  }
}
