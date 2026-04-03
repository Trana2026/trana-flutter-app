import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_modify_page/contract_modify_page.dart';
import 'package:trana/view/authenticated/contract_preview_page/widgets/contract_completion_bottom_sheet.dart';
import 'package:trana/widgets/primary_button.dart';

class ContractPreviewPage extends HookConsumerWidget { 
  const ContractPreviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final pdfViewerController = useMemoized(() => PdfViewerController());

    const int currentStep = 3;
    const int totalStep = 3;
    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "계약서 미리보기",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold"
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: barWidth,
              color: fxc(context).brandColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: fxc(context).borderOP!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SfPdfViewer.asset(
                    'assets/pdf/contract_sample.pdf',
                    controller: pdfViewerController,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: "수정하기",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContractModifyPage(),
                        ),
                      );
                    },
                    backgroundColor: vrc(context).secondaryColor!,
                    foregroundColor: vrc(context).textPrimary!,
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: PrimaryButton(
                    text: "생성하기",
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (bottomSheetContext) =>
                            ContractCompletionBottomSheet(
                              parentContext: context,
                            ),
                      );
                    },
                    backgroundColor: fxc(context).brandColor!,
                    foregroundColor: fxc(context).textBrand!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}