import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';

class ContractModifyPage extends HookConsumerWidget {
  const ContractModifyPage({super.key});

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
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: vrc(context).textPrimary,
        //     size: 20,
        //   ),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text(
          "계약서 미리보기",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            height: 1.5,
            letterSpacing: -0.17,
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
                    'assets/pdf/1234.pdf',
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
                    text: "취소하기",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: vrc(context).secondaryColor!,
                    foregroundColor: vrc(context).textPrimary!,
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: PrimaryButton(
                    text: "완료하기",
                    onTap: () {},
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
