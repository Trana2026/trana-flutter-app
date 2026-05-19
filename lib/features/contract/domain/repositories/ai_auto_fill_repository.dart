import 'package:image_picker/image_picker.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/ai_auto_fill_entity.dart';

abstract interface class AiAutoFillRepository {
  /// 거래 사진 목록 AI 분석 > 계약서 항목 반환
  Future<Result<AiAutoFillEntity>> analyzeImages(List<XFile> images);
}
