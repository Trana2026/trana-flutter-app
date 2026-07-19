import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';

class ContractPdfPreviewCard extends StatelessWidget {
  const ContractPdfPreviewCard({
    super.key,
    required this.isLoading,
    required this.pdfBytes,
  });

  final bool isLoading;
  final Uint8List? pdfBytes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: fxc(context).borderOP!),
      ),
      child: isLoading
          ? const CustomLoadingBar()
          : pdfBytes == null
          ? Center(child: Text('PDF를 불러올 수 없습니다.', style: context.txt()))
          : SfPdfViewerTheme(
              data: SfPdfViewerThemeData(
                backgroundColor: vrc(context).secondaryColor,
                progressBarColor: fxc(context).brandColor!,
                scrollHeadStyle: PdfScrollHeadStyle(
                  backgroundColor: vrc(context).background,
                ),
              ),
              child: SfPdfViewer.memory(pdfBytes!),
            ),
    );
  }
}
