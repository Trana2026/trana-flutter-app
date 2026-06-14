import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';

/// 계약서 내용 텍스트 생성 (title, body 분리)
List<({String title, String body})> buildContractContents({
  required String platform,
  required String productName,
  required int amount,
  required String conditionSummary,
  required String conditionDetails,
  required bool isWarranted,
  required DeliveryType transactionMethod,
}) {
  final amountText = amount.toString().toPriceFormat;
  final methodText = transactionMethod.label;

  return [
    (
      title: '제1조 (계약의 목적)',
      body:
          '본 계약은 판매자가 보유한 물품을 구매자에게 양도하고, 구매자는 그 대금을 지급함에 있어 당사자 간의 권리와 의무를 명확히 규정함을 목적으로 한다.',
    ),
    (
      title: '제2조 (거래 정보 및 방식)',
      body:
          '당사자는 다음 각호의 거래 조건을 확인하고 본 계약을 체결한다.\n'
          '1. 거래 플랫폼: $platform\n'
          '2. 거래 방식: $methodText\n'
          '3. 거래 물품명: $productName\n'
          '4. 거래 금액: 금 $amountText원정',
    ),
    (
      title: '제3조 (물품 상태 및 상세 설명)',
      body:
          '판매자는 구매자에게 물품의 상태를 성실하게 고지하여야 하며, 구매자는 이를 확인하고 거래에 동의한다.\n'
          '1. 상품 상태: $conditionSummary\n'
          '2. 상품 상세 설명: $conditionDetails',
    ),
    (
      title: '제4조 (판매자 보증 제공 여부)',
      body:
          '판매자는 제3조에 기재된 물품 상태 외의 중대한 하자가 발생한 경우에 대비하여, 다음과 같이 사후 보증(A/S 및 환불) 여부를 선택하여 구매자에게 제공한다.\n\n'
          '${isWarranted ? '[✓]' : '[ ]'} 보증 제공함: 물품 인도 후 3일 이내에 판매자가 고지하지 않은 기능적 하자가 발견된 경우, 판매자는 즉시 100% 환불 또는 배상할 의무를 진다.\n\n'
          '${!isWarranted ? '[✓]' : '[ ]'} 보증 제공하지 않음 (현 상태 인도): 판매자는 사전에 고지한 물품 상태를 기준으로 양도하며, 구매자의 단순 변심이나 사전에 합의된 하자를 이유로 한 환불 의무를 지지 않는다. (단, 제5조의 기본 진술 및 보장을 위반한 사기 행위는 본 항으로 면책되지 아니한다.)',
    ),
    (
      title: '제5조 (판매자의 필수 진술 및 보장)',
      body:
          '판매자는 다음 각 호의 사항을 필수적으로 보장하며, 이는 본 계약의 핵심 성립 조건이다.\n'
          '1. 판매자는 본 계약 체결 직전 수행한 신원인증(OCR 및 안면인식)이 본인의 유효한 명의이며, 타인 명의를 도용하거나 기망하지 않았음을 진술한다.\n'
          '2. 본 거래 물품은 판매자의 정당한 소유물이며, 장물 또는 위조품이 아님을 보장한다.\n'
          '3. 판매자는 고의로 물품의 중대한 하자(침수, 핵심 부품 고장 등)를 숨기고 기망하여 판매하지 않았음을 보장한다.',
    ),
    (
      title: '제6조 (계약의 해제 및 위약벌)',
      body:
          '1. 판매자가 제5조를 위반하여 고의적인 기망 또는 사기 행위를 한 경우, 구매자는 즉시 본 계약을 해제할 수 있다.\n'
          '2. 본 조 제1항에 따라 계약이 해제될 경우, 위반 당사자는 거래 금액의 2배에 해당하는 금액을 위약벌로 지급하여야 한다.\n'
          '3. 계약 체결 후 당사자 간 별도의 합의가 없는 한 24시간 이내에 대금 지급 또는 물품 인도(직거래)가 이루어지지 않을 경우, 계약은 일방의 통보로 해제될 수 있다.',
    ),
    (
      title: '제7조 (분쟁 해결 및 관할법원)',
      body:
          '본 계약과 관련하여 분쟁이 발생하는 경우, 본 계약서에 기록된 전자서명 및 사전 신원인증 로그 데이터를 최우선 증거로 삼는다.\n'
          '소송이 제기될 경우 구매자의 주소지 관할 법원을 합의관할법원으로 한다.\n'
          '사기 등의 혐의로 수사기관의 적법한 요청이 발생할 경우, 플랫폼은 관련 법령에 따라 계약 체결 시 수집된 신원인증 정보를 제공할 수 있다.',
    ),
    (
      title: '제8조 (플랫폼의 지위 및 면책)',
      body:
          'Trana는 당사자 간의 안전한 전자계약 시스템 및 신원인증 솔루션을 제공할 뿐, 본 거래의 당사자가 아니다.\n'
          '당사자 간의 대금 지급, 물품 인도 및 하자에 대한 모든 법적 책임은 거래 당사자에게 있으며 Trana는 이에 대하여 면책된다.',
    ),
  ];
}
