import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_auto_fill_entity.freezed.dart';

/// AI 이미지 분석 후 결과값
@freezed
abstract class AiAutoFillEntity with _$AiAutoFillEntity {
  const factory AiAutoFillEntity({
    String? productName, // 거래 물품명
    int? amount, // 거래 금액
    String? conditionSummary, // 상품 상태
    String? conditionDetails, // 상품 상세 설명
  }) = _AiAutoFillEntity;
}
