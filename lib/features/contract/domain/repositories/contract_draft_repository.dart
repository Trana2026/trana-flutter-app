import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';

abstract interface class ContractDraftRepository {
  Future<Result<ContractDraftEntity>> createDraft({
    DeliveryType? deliveryType,
    Role? creatorRole,
    ConsentType? consentType,
  });

  Future<Result<ContractDraftEntity>> readDraft({required String publicCode});

  Future<Result<void>> deleteDraft({required String publicCode});

  Future<Result<ContractDraftEntity>> updateDraft({
    required String publicCode,
    String? title,
    int? price,
    String? conditionSummary,
    String? conditionDetails,
    DeliveryType? deliveryType,
    Role? creatorRole,
  });
}
