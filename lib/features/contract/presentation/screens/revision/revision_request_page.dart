import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_bottom_sheet.dart';
import 'package:trana/features/contract/presentation/screens/revision/widgets/contract_pages_view.dart';
import 'package:trana/features/contract/presentation/widgets/modals/revision_request_bottom_sheet.dart';

class RevisionRequestPage extends HookConsumerWidget {
  const RevisionRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLength = useState<int>(0);
    final isPending = useRef(false);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "계약서 수정",
        onTapLeading: () => context.pop(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: fxc(context).borderOP!),
              ),
              child: ContractPagesView(
                onSelectedCountChanged: (count) => selectedLength.value = count,
              ),
            ),

            Positioned(
              left: 25,
              right: 25,
              bottom: 30,
              child: GestureDetector(
                onTap: () async {
                  if (selectedLength.value == 0) return;
                  if (isPending.value) return;
                  isPending.value = true;
                  try {
                    await showCustomBottomSheet<void>(
                      context,
                      const RevisionRequestBottomSheet(),
                    );
                  } finally {
                    isPending.value = false;
                  }
                },
                child: Container(
                  height: 68,
                  padding: const EdgeInsets.fromLTRB(14, 14, 20, 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: vrc(context).secondaryColor,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: vrc(context).tertiaryColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${selectedLength.value}",
                          style: context.txt(
                            color: fxc(context).brandColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "선택한 ${selectedLength.value}개의 영역 수정 요청하기",
                        style: context.txt(color: vrc(context).textPrimary),
                      ),
                      const Spacer(),
                      Icon(
                        CooliconsIcon.arrowRightMd,
                        color: vrc(context).iconDisable,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
