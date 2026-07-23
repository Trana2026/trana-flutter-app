import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/dtos/contract_draft_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/dispute_state.dart';

extension ContractDraftMapper on ContractDraftDto {
  ContractDraftEntity toEntity() {
    return ContractDraftEntity(
      publicCode: publicCode,
      status: ContractStatus.values.fromApiString(
        status,
        fallback: ContractStatus.inProgress,
      ),
      disputeState: DisputeState.values.fromApiString(
        disputeState,
        fallback: DisputeState.none,
      ),
      deliveryType: DeliveryType.values.tryFromApiString(deliveryType),
      consentType: ConsentType.values.tryFromApiString(consentType),
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
      riskSignals: riskSignals?.toEntity(),
    );
  }
}

extension ContractRiskSignalsMapper on ContractRiskSignalsDto {
  ContractRiskSignalsEntity toEntity() {
    return ContractRiskSignalsEntity(
      hasReportHistory: hasReportHistory,
      trustScoreZero: trustScoreZero,
      counterpartyTrustScore: counterpartyTrustScore,
      counterpartyTrustGrade: counterpartyTrustGrade,
      counterpartyIsMinor: counterpartyIsMinor,
      counterpartyVerified: counterpartyVerified,
      counterpartyTradeCount: counterpartyTradeCount,
      counterpartyDisputeCount: counterpartyDisputeCount,
      counterpartyConfirmedReportCount: counterpartyConfirmedReportCount,
    );
  }
}
