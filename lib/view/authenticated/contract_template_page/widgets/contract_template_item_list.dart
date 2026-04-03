import 'package:flutter/material.dart';
import 'package:trana/view/authenticated/contract_template_page/widgets/contract_template_item.dart';

class ContractTemplateItemList extends StatelessWidget {
  const ContractTemplateItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ContractTemplateItem(
          image: Image.asset("assets/images/pc.webp"), 
          categoryName: "전자 기기", 
          productType: "스마트폰/태블릿/PC", 
          descriptionText: "기기 상태, 배터리 효율, 구성품 명시가\n포함된 표준 계약서"
        ),
        ContractTemplateItem(
          image: Image.asset("assets/images/appliance.webp"), 
          categoryName: "전자 기기", 
          productType: "대형 가전 제품", 
          descriptionText: "운송 방법 및 설치, 작동 여부 확인이\n포함된 계약서"
        ),
        ContractTemplateItem(
          image: Image.asset("assets/images/luxury.webp"), 
          categoryName: "고가/명품", 
          productType: "명품/시계/주얼리", 
          descriptionText: "정품 인증, 보증서 유무, 감정 절차가\n포함된 계약서"
        ),
        ContractTemplateItem(
          image: Image.asset("assets/images/furniture2.webp"),
          categoryName: "가구/인테리어", 
          productType: "가구", 
          descriptionText: "크기, 스크래치 등 외관 상태와 운송\n책임이 포함된 계약서"
        ),
        ContractTemplateItem(
          image: Image.asset("assets/images/box.webp"), 
          categoryName: "기타", 
          productType: "일반 중고거래", 
          descriptionText: "기본적인 형태의 범용 중고거래 계약서"
        ),
      ],
    );
  }
}