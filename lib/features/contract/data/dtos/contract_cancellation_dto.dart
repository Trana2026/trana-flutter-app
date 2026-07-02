import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_cancellation_dto.freezed.dart';
part 'contract_cancellation_dto.g.dart';

@freezed
abstract class ContractCancellationDto with _$ContractCancellationDto {
  const factory ContractCancellationDto({
    required int cancellationRequestId,
    required String reason,
    required String detail,
    required String status,
    required DateTime requestedAt,
    DateTime? confirmedAt,
    required bool isMine,
  }) = _ContractCancellationDto;

  factory ContractCancellationDto.fromJson(Map<String, dynamic> json) =>
      _$ContractCancellationDtoFromJson(json);
}
