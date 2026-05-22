import 'package:trana/core/utils/string_extensions.dart';
import 'package:trana/features/contract/domain/enums/transaction_method.dart';

/// 계약서 내용 텍스트 생성 (title, body 분리)
List<({String title, String body})> buildContractContents({
  required String productName,
  required int amount,
  required TransactionMethod transactionMethod,
}) {
  final nameText = productName;
  final amountText = amount.toString().toPriceFormat;
  final methodText = transactionMethod.label;

  return [
    (title: '제1조 [목적]', body: '본 계약은 판매자가 제공한 정보에 기반하여 작성되었습니다.'),
    (title: '제2조 [거래 대상]', body: '물품명: $nameText\n금액: $amountText원'),
    (title: '제3조 [인도]', body: '본 거래는 $methodText 방식으로 진행됩니다.'),
    (title: '제4조 [서명]', body: '본 문서는 전자서명법에 의거하여 법적 효력을 가진다.'),
  ];
}
