import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_receiver_signed_entity.dart';

abstract interface class ContractInvitationRepository {
  Future<Result<ContractDraftEntity>> requestRevision({
    required String publicCode,
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
}
