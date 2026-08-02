import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/config/app_config.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/auth/presentation/viewmodels/pass_verify_view_model.dart';
import 'package:trana/features/user/presentation/providers/me_provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// 인앱웹뷰 설정
InAppWebViewSettings _webViewSettings() => InAppWebViewSettings(
  javaScriptEnabled: true,
  useShouldOverrideUrlLoading: true,
  // mobileOK 표준창이 팝업으로 열리므로 새 창 생성 허용
  supportMultipleWindows: true,
  javaScriptCanOpenWindowsAutomatically: true,
  mediaPlaybackRequiresUserGesture: false,
  mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
  isInspectable: kDebugMode,
  // iOS 바운스, 오버스크롤 제거 (UX 안좋음)
  disallowOverScroll: true,
);

/// PASS 앱 등 외부 스킴 처리
Future<NavigationActionPolicy> _handleExternalScheme(
  BuildContext context,
  NavigationAction navigationAction,
) async {
  final uri = navigationAction.request.url;
  if (uri == null) return NavigationActionPolicy.ALLOW;

  if (uri.scheme != 'http' && uri.scheme != 'https') {
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      if (context.mounted) {
        showErrorToast(context, '인증 앱을 열 수 없습니다.');
      }
    }
    return NavigationActionPolicy.CANCEL;
  }
  return NavigationActionPolicy.ALLOW;
}

/// PASS 본인인증 웹뷰 화면
class PassVerifyPage extends HookConsumerWidget {
  final String signupSessionId;

  const PassVerifyPage({super.key, required this.signupSessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(passVerifyViewModelProvider.notifier);
    final isPageLoading = useState(true);
    // 웹 결과 콜백 수신 여부
    final resultReceived = useRef(false);

    final passUrl =
        '${AppConfig.kycWebBaseUrl}/auth/pass'
        '?signupSessionId=${Uri.encodeQueryComponent(signupSessionId)}';

    // 완료 시 JWT 수신 처리 후 홈으로 이동
    Future<void> onPassResult(List<dynamic> args) async {
      if (kDebugMode) debugPrint('[PASS] onPassResult called: $args');
      // 이미 처리한 결과 콜백이면 무시
      // 메인 웹뷰와 팝업 웹뷰 양쪽에 JS 브릿지 핸들러를 등록했기 때문에
      // 최초 1회만 처리하고 이후 콜백은 무시하는 방어 로직
      if (resultReceived.value) return;

      if (args.isEmpty || args.first is! Map) return;
      final payload = Map<String, dynamic>.from(args.first as Map);
      resultReceived.value = true;

      final success = await vm.completeSignIn(payload);
      if (!context.mounted) return;

      if (!success) {
        final state = ref.read(passVerifyViewModelProvider);
        showErrorToast(context, state.error!);
        vm.clearError();
        return;
      }

      // JWT 기준으로 사용자 정보 재조회
      ref.invalidate(meProvider);
      context.go(AppRoutes.home);
    }

    // 표준창 팝업(window.open)을 전체 화면 웹뷰로 렌더링
    Future<bool> onCreateWindow(
      InAppWebViewController controller,
      CreateWindowAction createWindowAction,
    ) async {
      if (kDebugMode) debugPrint('[PASS] onCreateWindow');
      if (!context.mounted) return false;
      await showDialog<void>(
        context: context,
        builder: (dialogContext) => _PassPopupDialog(
          windowId: createWindowAction.windowId,
          onPassResult: onPassResult,
        ),
      );
      if (kDebugMode) {
        debugPrint(
          '[PASS] popup closed (resultReceived=${resultReceived.value})',
        );
      }
      return true;
    }

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: vrc(context).background,
        centerTitle: true,
        title: Text(
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        // 표준창에서 백버튼시 pop 처리
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: vrc(context).iconPrimary,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(passUrl)),
            initialSettings: _webViewSettings(),
            onWebViewCreated: (controller) {
              controller.addJavaScriptHandler(
                handlerName: 'onPassResult',
                callback: onPassResult,
              );
            },
            onConsoleMessage: (controller, msg) {
              if (kDebugMode) debugPrint('[PASS/main] ${msg.message}');
            },
            onLoadStop: (controller, url) => isPageLoading.value = false,
            onCreateWindow: onCreateWindow,
            // SSL 인증서 처리
            onReceivedServerTrustAuthRequest: (controller, challenge) async =>
                ServerTrustAuthResponse(
                  action: ServerTrustAuthResponseAction.PROCEED,
                ),
            shouldOverrideUrlLoading: (controller, navigationAction) =>
                _handleExternalScheme(context, navigationAction),
          ),
          if (isPageLoading.value)
            Center(
              child: CircularProgressIndicator(color: fxc(context).brandColor),
            ),
        ],
      ),
    );
  }
}

/// mobileOK 팝업을 표시하는 전체 화면 다이얼로그
class _PassPopupDialog extends StatelessWidget {
  final int windowId;
  final Future<void> Function(List<dynamic> args) onPassResult;

  const _PassPopupDialog({required this.windowId, required this.onPassResult});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: vrc(context).background,
      child: SafeArea(
        child: InAppWebView(
          windowId: windowId,
          initialSettings: _webViewSettings(),
          // window.open()으로 생성된 팝업 웹뷰에도 JS 브릿지 핸들러 등록
          // 메인 웹뷰와 팝업 웹뷰는 별도 WebView 인스턴스이므로
          // PASS 결과 콜백이 팝업 컨텍스트에서 호출되는 경우를 대비하는 방어 로직
          onWebViewCreated: (controller) {
            controller.addJavaScriptHandler(
              handlerName: 'onPassResult',
              callback: onPassResult,
            );
          },
          onConsoleMessage: (controller, msg) {
            if (kDebugMode) debugPrint('[PASS/popup] ${msg.message}');
          },
          shouldOverrideUrlLoading: (controller, navigationAction) =>
              _handleExternalScheme(context, navigationAction),
          onReceivedServerTrustAuthRequest: (controller, challenge) async =>
              ServerTrustAuthResponse(
                action: ServerTrustAuthResponseAction.PROCEED,
              ),
          // 표준창이 window.close() 호출 시 팝업 닫기
          onCloseWindow: (controller) {
            if (Navigator.of(context).canPop()) Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
