import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/contract/domain/enums/dispute_state.dart';

part 'contract_dispute_entity.freezed.dart';

@freezed
abstract class ContractDisputeEntity with _$ContractDisputeEntity {
  const factory ContractDisputeEntity({
    required int disputeId,
    required String reason,
    required String detail,
    required DisputeState status,
    required DateTime reportedAt,
    DateTime? cancelledAt,
    required bool isMine,
  }) = _ContractDisputeEntity;
}
