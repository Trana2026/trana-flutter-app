import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/pdf_entity.dart';
import 'package:trana/features/contract/domain/repositories/pdf_repository.dart';
import 'package:trana/features/contract/domain/utils/contract_text_builder.dart';

class PdfRepositoryImpl implements PdfRepository {
  PdfRepositoryImpl();

  static const double _leftPadding = 20;
  static const double _topPadding = 24;
  static const double _rightPadding = 20;
  static const double _bottomPadding = 40;
  static const double _sectionSpacing = 24;

  @override
  Future<Result<Uint8List>> generatePdf(PdfEntity entries) async {
    try {
      // ==================== Fonts ====================

      final regularBytes = await rootBundle
          .load('assets/fonts/Pretendard-Regular.ttf')
          .then((e) => e.buffer.asUint8List());
      final boldBytes = await rootBundle
          .load('assets/fonts/Pretendard-Bold.ttf')
          .then((e) => e.buffer.asUint8List());
      final regularFont = PdfTrueTypeFont(regularBytes, 13);
      final boldFont = PdfTrueTypeFont(boldBytes, 15);
      final titleFont = PdfTrueTypeFont(boldBytes, 24);
      final signTitleFont = PdfTrueTypeFont(boldBytes, 14);
      final signPlaceholderFont = PdfTrueTypeFont(regularBytes, 11);

      // ==================== Document ====================

      final document = PdfDocument();
      PdfPage currentPage = document.pages.add();
      final firstGraphics = currentPage.graphics;
      final firstPageSize = currentPage.getClientSize();
      final contentWidth = firstPageSize.width - _leftPadding - _rightPadding;
      final black = PdfBrushes.black;
      final gray = PdfSolidBrush(PdfColor(120, 120, 120));
      final lightGray = PdfSolidBrush(PdfColor(242, 242, 242));

      double y = _topPadding;

      // ==================== 제목 ====================

      firstGraphics.drawString(
        '물품 매매 계약서',
        titleFont,
        brush: black,
        bounds: Rect.fromLTWH(_leftPadding, y, contentWidth, 40),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );

      y += 72;

      var cursor = PdfCursor(page: currentPage, y: y);

      // ==================== 조항 ====================

      for (final section in buildContractContents(
        productName: entries.productName,
        amount: entries.amount,
        transactionMethod: entries.transactionMethod,
      )) {
        cursor = await _drawSection(
          document: document,
          cursor: cursor,
          title: section.title,
          body: section.body,
          titleFont: boldFont,
          bodyFont: regularFont,
        );
      }

      // ==================== 서명 ====================

      currentPage = cursor.page;
      final currentGraphics = currentPage.graphics;
      final currentPageSize = currentPage.getClientSize();
      const signBoxWidth = 130.0;
      const signBoxHeight = 78.0;
      final signX = currentPageSize.width - _rightPadding - signBoxWidth;
      final signY =
          currentPageSize.height - _bottomPadding - signBoxHeight - 30;

      currentGraphics.drawString(
        '판매자 서명',
        signTitleFont,
        brush: black,
        bounds: Rect.fromLTWH(signX, signY, signBoxWidth, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );

      currentGraphics.drawRectangle(
        brush: lightGray,
        pen: PdfPen(PdfColor(210, 210, 210), width: 1),
        bounds: Rect.fromLTWH(signX, signY + 30, signBoxWidth, signBoxHeight),
      );

      currentGraphics.drawString(
        '(비어있음)',
        signPlaceholderFont,
        brush: gray,
        bounds: Rect.fromLTWH(signX, signY + 58, signBoxWidth, 20),
        format: PdfStringFormat(alignment: PdfTextAlignment.center),
      );

      // ==================== 바이트로 생성 ====================

      final bytes = await document.save();
      document.dispose();
      return Success(Uint8List.fromList(bytes));
    } catch (e) {
      debugPrint('[PdfRepo] generatePdf unexpected: $e');
      return const Failure(CacheFailure());
    }
  }

  @override
  Future<Result<String>> savePdf(Uint8List pdfBytes) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[PdfRepo] savePdf: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[PdfRepo] savePdf unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  Future<PdfCursor> _drawSection({
    required PdfDocument document,
    required PdfCursor cursor,
    required String title,
    required String body,
    required PdfFont titleFont,
    required PdfFont bodyFont,
  }) async {
    PdfPage currentPage = cursor.page;
    final graphics = currentPage.graphics;
    final pageSize = currentPage.getClientSize();
    final contentWidth = pageSize.width - _leftPadding - _rightPadding;
    double y = cursor.y;

    graphics.drawString(
      title,
      titleFont,
      brush: PdfBrushes.black,
      bounds: Rect.fromLTWH(_leftPadding, y, contentWidth, 24),
    );

    y += 34;

    final element = PdfTextElement(
      text: body,
      font: bodyFont,
      brush: PdfBrushes.black,
    );
    final result = element.draw(
      page: currentPage,
      bounds: Rect.fromLTWH(_leftPadding, y, contentWidth, 999999),
      format: PdfLayoutFormat(layoutType: PdfLayoutType.paginate),
    );
    final lastPage = result!.page;
    final nextY = result.bounds.bottom + _sectionSpacing;

    return PdfCursor(page: lastPage, y: nextY);
  }
}

class PdfCursor {
  const PdfCursor({required this.page, required this.y});

  final PdfPage page;
  final double y;

  PdfCursor copyWith({PdfPage? page, double? y}) {
    return PdfCursor(page: page ?? this.page, y: y ?? this.y);
  }
}
