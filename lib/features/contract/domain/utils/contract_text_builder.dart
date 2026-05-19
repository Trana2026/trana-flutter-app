import 'package:trana/features/contract/domain/entities/pdf_entity.dart';
import 'package:trana/features/contract/domain/enums/transaction_method.dart';

/// title, body 분리 (PDF 생성용)
List<({String title, String body})> buildContractSections(PdfEntity entries) {
  final method = switch (entries.transactionMethod) {
    TransactionMethod.direct => '직거래',
    TransactionMethod.delivery => '택배 거래',
  };
  final amount = _formatPrice(entries.amount);

  return [
    (title: '제1조 [목적]', body: '본 계약은 판매자가 제공한 정보에 기반하여 작성되었습니다.'),
    (title: '제2조 [거래 대상]', body: '물품명: ${entries.productName}\n금액: $amount원'),
    (title: '제3조 [인도]', body: '본 거래는 $method 방식으로 진행됩니다.'),
    (title: '제4조 [서명]', body: '본 문서는 전자서명법에 의거하여 법적 효력을 가진다.'),
  ];
}

/// 고지내용 전문
String buildDisclosureText(PdfEntity entries) {
  return buildContractSections(
    entries,
  ).map((s) => '${s.title}\n${s.body}').join('\n\n');
}

String _formatPrice(int amount) {
  final str = amount.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < str.length; i++) {
    if (i > 0 && (str.length - i) % 3 == 0) buffer.write(',');
    buffer.write(str[i]);
  }
  return buffer.toString();
}
