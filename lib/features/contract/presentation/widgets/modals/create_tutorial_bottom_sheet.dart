import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:trana/core/constants/app_durations.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/create_tutorial_page_item.dart';

/// 튜토리얼 페이지별 안내 문구
const _tutorialDescriptions = [
  '1. 직거래/택배 거래를 선택해주세요',
  '2. 카메라 버튼을 눌러 사진을 추가해주세요',
  '3. 사진은 상품의 상세 내용, 제품 사진 위주로\n첨부해주세요',
  '4. 분석하기를 누르면 이미지를 분석해요',
  '5. AI가 자동으로 계약 내용을 작성해줘요\n직접 작성,수정도 가능해요',
  '6. 판매자는 개인 보증을 제공해줄 수 있어요.\n보증하고 신뢰 점수를 받아보세요',
];

/// 애니메이션이 적용되는 페이지
const _lottiePage = 3;

/// 새 계약 작성 안내 튜토리얼 바텀시트
class CreateTutorialBottomSheet extends HookConsumerWidget {
  const CreateTutorialBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = usePageController();
    final page = useState(0);

    final total = _tutorialDescriptions.length;
    final isLast = page.value == total - 1;

    void close() => Navigator.of(context).pop();

    void next() {
      if (isLast) {
        close();
        return;
      }
      controller.nextPage(
        duration: AppDurations.transition,
        curve: Curves.easeOut,
      );
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
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 헤더
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '계약 생성 과정을 안내해드릴게요',
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontSize: 17,
                        fontFamily: 'PretendardBold',
                        letterSpacing: -0.17,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: close,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        CooliconsIcon.closeMd,
                        size: 24,
                        color: vrc(context).iconSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 페이지
              SizedBox(
                height: 360,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (i) => page.value = i,
                  itemCount: total,
                  itemBuilder: (_, i) => CreateTutorialPageItem(
                    description: _tutorialDescriptions[i],
                    illustration: _illustration(context, i + 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 페이지 인디케이터
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < total; i++) ...[
                    if (i > 0) const SizedBox(width: 6),
                    _Dot(active: i == page.value),
                  ],
                ],
              ),
              const SizedBox(height: 20),

              // 다음 / 계약 생성하기
              SizedBox(
                width: double.infinity,
                height: 54,
                child: Material(
                  color: fxc(context).brandColor,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: next,
                    child: Center(
                      child: Text(
                        isLast ? '계약 생성하기' : '다음',
                        style: TextStyle(
                          color: fxc(context).textBrand,
                          fontSize: 16,
                          fontFamily: 'PretendardSemiBold',
                          letterSpacing: -0.16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // 건너뛰기
              InkWell(
                onTap: close,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    '건너뛰고 계약 생성하기',
                    style: TextStyle(
                      color: vrc(context).textTertiary,
                      fontSize: 13,
                      fontFamily: 'PretendardMedium',
                      letterSpacing: -0.13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 페이지 번호에 맞는 일러스트 위젯
  Widget _illustration(BuildContext context, int page) {
    if (page == _lottiePage) {
      return Lottie.asset(
        'assets/anim/tutorial_popup/tutorialpopup_3.json',
        fit: BoxFit.contain,
        repeat: true,
      );
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final suffix = isDark ? 'dark' : 'light';
    return Image.asset(
      'assets/images/tutorial_popup/tutorialpopup_${page}_$suffix.webp',
      fit: BoxFit.contain,
    );
  }
}

/// 페이지 인디케이터
class _Dot extends StatelessWidget {
  const _Dot({required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.transition,
      width: active ? 18 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? fxc(context).brandColor : vrc(context).disableColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
