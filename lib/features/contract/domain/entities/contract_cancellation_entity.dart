import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_cancellation_entity.freezed.dart';

@freezed
abstract class ContractCancellationEntity with _$ContractCancellationEntity {
  const factory ContractCancellationEntity({
    required int cancellationRequestId,
    required String reason,
    required String detail,
    required String status,
    required DateTime requestedAt,
    DateTime? confirmedAt,
    required bool isMine,
  }) = _ContractCancellationEntity;
}
