import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/contract_minor_disclosure_confirm_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_minor_disclosure_entity.dart';

abstract interface class ContractMinorDisclosureRepository {
  Future<Result<ContractMinorDisclosureEntity>> readLatest();

  Future<Result<ContractMinorDisclosureConfirmEntity>> confirm({
    required String publicCode,
    required DateTime disclosedAt,
    required String templateVersion,
  });
}
