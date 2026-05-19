import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/transaction_method.dart';

part 'pdf_entity.freezed.dart';

/// 계약서 PDF 생성에 들어가는 항목
@freezed
abstract class PdfEntity with _$PdfEntity {
  const factory PdfEntity({
    required String productName, // 거래 물품명
    required int amount, // 거래 금액
    required String conditionSummary, // 상품 상태
    required String conditionDetails, // 상품 상세 설명
    required TransactionMethod transactionMethod, // 거래 방식
    String? buyerSign, // 구매자 서명 png
    String? sellerSign, // 판매자 서명 png
  }) = _PdfEntity;
}
