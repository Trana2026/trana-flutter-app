import 'package:trana/core/utils/enum_extension.dart';
import 'package:trana/features/contract/data/dtos/contract_draft_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';

extension ContractDraftMapper on ContractDraftDto {
  ContractDraftEntity toEntity() {
    return ContractDraftEntity(
      publicCode: publicCode,
      status: ContractStatus.values.fromApiString(status),
      disputeState: disputeState,
      deliveryType: deliveryType != null
          ? DeliveryType.values.fromApiString(deliveryType!)
          : null,
      consentType: consentType != null
          ? ConsentType.values.fromApiString(consentType!)
          : null,
      tradingPlatform: tradingPlatform,
      title: title,
      price: price,
      conditionSummary: conditionSummary,
      conditionDetails: conditionDetails,
      warrantyPeriodDays: warrantyPeriodDays,
      guardianConsentAt: guardianConsentAt,
      version: version,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
