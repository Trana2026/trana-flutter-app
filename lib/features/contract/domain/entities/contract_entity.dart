import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/entities/contract_status.dart';
import 'package:trana/features/contract/domain/entities/user_role.dart';

part 'contract_entity.freezed.dart';

@freezed
abstract class ContractEntity with _$ContractEntity {
  const factory ContractEntity({
    required String id,
    required String itemName,
    required String price,
    required ContractStatus status,
    required UserRole userRole,
    required DateTime createdAt,
  }) = _ContractEntity;
}
