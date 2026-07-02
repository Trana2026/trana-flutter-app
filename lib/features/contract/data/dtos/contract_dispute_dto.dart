import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_dispute_dto.freezed.dart';
part 'contract_dispute_dto.g.dart';

@freezed
abstract class ContractDisputeDto with _$ContractDisputeDto {
  const factory ContractDisputeDto({
    required int disputeId,
    required String reason,
    required String detail,
    required String status,
    required DateTime reportedAt,
    DateTime? cancelledAt,
    required bool isMine,
  }) = _ContractDisputeDto;

  factory ContractDisputeDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDisputeDtoFromJson(json);
}

@freezed
abstract class ContractDisputeListDto with _$ContractDisputeListDto {
  const factory ContractDisputeListDto({
    required List<ContractDisputeDto> disputes,
  }) = _ContractDisputeListDto;

  factory ContractDisputeListDto.fromJson(Map<String, dynamic> json) =>
      _$ContractDisputeListDtoFromJson(json);
}
