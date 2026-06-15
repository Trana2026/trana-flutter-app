import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_signed_entity.dart';

abstract interface class ContractLifecycleRepository {
  Future<Result<ContractDraftEntity>> fromReadyToShared({
    required String publicCode,
    required String receiverName,
    required String receiverPhone,
  });

  Future<Result<ContractDraftEntity>> fromReadyToDraft(String publicCode);

  Future<Result<ContractDraftEntity>> fromDraftToReady(String publicCode);

  Future<Result<ContractSignedEntity>> fromReceiverSignedToSigned({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  });
}
