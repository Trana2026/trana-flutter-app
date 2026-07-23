import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:markdown_widget/markdown_widget.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';
import 'package:trana/features/profile/presentation/viewmodels/term_detail_view_model.dart';

/// <br> 태그를 줄바꿈으로 변환 (표 셀 내 줄바꿈 지원)
class _BrInlineSyntax extends md.InlineSyntax {
  _BrInlineSyntax() : super(r'<br\s*/?>', caseSensitive: false);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    parser.addNode(md.Element.empty('br'));
    return true;
  }
}

/// 약관 전문 마크다운 렌더 화면
class TermsDetailPage extends HookConsumerWidget {
  /// 약관 id로 조회
  const TermsDetailPage({super.key, required int termsId})
    : _termsId = termsId,
      _type = null;

  /// 약관 타입으로 조회
  const TermsDetailPage.type({super.key, required TermsType type})
    : _type = type,
      _termsId = null;

  final int? _termsId;
  final TermsType? _type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(termDetailViewModelProvider);
    final vm = ref.read(termDetailViewModelProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final termsId = _termsId;
        final success = await (termsId != null
            ? vm.loadContent(termsId)
            : vm.loadContentByType(_type!));
        if (!context.mounted) return;
        if (!success) {
          final s = ref.read(termDetailViewModelProvider);
          showErrorToast(context, s.error!);
          vm.clearError();
        }
      });
      return null;
    }, const []);

    final content = state.content;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: content?.title ?? '',
        onTapLeading: () => Navigator.of(context).pop(),
      ),
      body: state.isLoading || content == null
          ? const Center(child: CustomLoadingBar())
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              child: MarkdownBlock(
                data: content.content,
                config: _markdownConfig(context),
                generator: MarkdownGenerator(
                  inlineSyntaxList: [_BrInlineSyntax()],
                ),
              ),
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton.brand(
            text: "확인",
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }

  /// 마크다운 렌더
  MarkdownConfig _markdownConfig(BuildContext context) {
    final primary = vrc(context).textPrimary!;
    final secondary = vrc(context).textSecondary!;
    final border = vrc(context).borderPrimary!;
    final brand = fxc(context).brandColor!;

    TextStyle heading(double size) => TextStyle(
      color: primary,
      fontSize: size,
      fontFamily: 'PretendardBold',
      height: 1.4,
    );

    return MarkdownConfig(
      configs: [
        H1Config(style: heading(22)),
        H2Config(style: heading(19)),
        H3Config(style: heading(16)),
        H4Config(style: heading(15)),
        PConfig(
          textStyle: TextStyle(
            color: secondary,
            fontSize: 14,
            fontFamily: 'PretendardMedium',
            height: 1.6,
          ),
        ),
        LinkConfig(
          style: TextStyle(color: brand, decoration: TextDecoration.underline),
        ),
        BlockquoteConfig(sideColor: brand, textColor: secondary),
        HrConfig(color: border),
        TableConfig(
          bodyStyle: TextStyle(color: secondary, fontSize: 13),
          headerStyle: TextStyle(
            color: primary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          border: TableBorder.all(color: border),
          // 가용 너비를 꽉 채우도록 열 폭 균등 분배 (가로 스크롤 없음)
          defaultColumnWidth: const FlexColumnWidth(),
          wrapper: (table) => SizedBox(width: double.infinity, child: table),
        ),
      ],
    );
  }
}
