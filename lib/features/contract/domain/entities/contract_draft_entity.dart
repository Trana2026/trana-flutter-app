import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/dispute_state.dart';

part 'contract_draft_entity.freezed.dart';

@freezed
abstract class ContractDraftEntity with _$ContractDraftEntity {
  const factory ContractDraftEntity({
    required String publicCode,
    required ContractStatus status,
    required DisputeState disputeState,
    DeliveryType? deliveryType,
    ConsentType? consentType,
    String? tradingPlatform,
    String? title,
    int? price,
    String? conditionSummary,
    String? conditionDetails,
    required int warrantyPeriodDays,
    DateTime? guardianConsentAt,
    required int version,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool guardianNotConsented,
    @Default(false) bool hasReportHistory,
  }) = _ContractDraftEntity;
}
