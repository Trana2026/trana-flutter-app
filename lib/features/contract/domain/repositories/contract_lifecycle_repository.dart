import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_signed_entity.dart';

abstract interface class ContractLifecycleRepository {
  Future<Result<ContractDraftEntity>> share({
    required String publicCode,
    required String receiverName,
    required String receiverPhone,
  });

  Future<Result<ContractDraftEntity>> revert(String publicCode);

  Future<Result<ContractDraftEntity>> ready(String publicCode);

  Future<Result<ContractSignedEntity>> creatorSign({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  });
}
