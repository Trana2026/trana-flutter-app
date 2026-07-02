import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_receiver_signed_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_revision_reason_entity.dart';

abstract interface class ContractInvitationRepository {
  Future<Result<ContractDraftEntity>> revisions({
    required String publicCode,
    String? deliveryTypeReason,
    String? tradingPlatformReason,
    String? titleReason,
    String? priceReason,
    String? conditionSummaryReason,
    String? conditionDetailsReason,
  });

  Future<Result<ContractReceiverSignedEntity>> receiverSign({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  });

  Future<Result<ContractDraftEntity>> acceptInvitation(String token);

  Future<Result<ContractDraftEntity>> receiverWarranty({
    required String publicCode,
    required int warrantyPeriodDays,
  });

  Future<Result<ContractRevisionReasonEntity>> latest({
    required String publicCode,
  });
}
