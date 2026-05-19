import 'package:flutter/services.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/pdf_entity.dart';

abstract interface class PdfRepository {
  /// 계약서 항목으로 PDF 생성 > byte 반환
  Future<Result<Uint8List>> generatePdf(PdfEntity entries);

  /// PDF byte 백엔드 저장 > S3 저장 경로 반환
  Future<Result<String>> savePdf(Uint8List pdfBytes);
}
