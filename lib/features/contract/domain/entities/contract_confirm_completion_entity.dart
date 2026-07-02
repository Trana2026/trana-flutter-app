import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

part 'contract_confirm_completion_entity.freezed.dart';

@freezed
abstract class ContractConfirmCompletionEntity
    with _$ContractConfirmCompletionEntity {
  const factory ContractConfirmCompletionEntity({
    required String publicCode,
    required ContractStatus status,
    DateTime? sellerCompletedAt,
    DateTime? buyerCompletedAt,
    DateTime? completedAt,
  }) = _ContractConfirmCompletionEntity;
}
