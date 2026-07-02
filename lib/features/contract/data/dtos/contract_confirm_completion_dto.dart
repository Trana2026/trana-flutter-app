import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_confirm_completion_dto.freezed.dart';
part 'contract_confirm_completion_dto.g.dart';

@freezed
abstract class ContractConfirmCompletionDto
    with _$ContractConfirmCompletionDto {
  const factory ContractConfirmCompletionDto({
    required String publicCode,
    required String status,
    DateTime? sellerCompletedAt,
    DateTime? buyerCompletedAt,
    DateTime? completedAt,
  }) = _ContractConfirmCompletionDto;

  factory ContractConfirmCompletionDto.fromJson(Map<String, dynamic> json) =>
      _$ContractConfirmCompletionDtoFromJson(json);
}
