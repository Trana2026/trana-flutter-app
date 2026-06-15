import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_receiver_signed_dto.freezed.dart';
part 'contract_receiver_signed_dto.g.dart';

@freezed
abstract class ContractReceiverSignedDto with _$ContractReceiverSignedDto {
  const factory ContractReceiverSignedDto({
    required String publicCode,
    required String status,
    required int pdfVersion,
    required DateTime receiverSignedAt,
  }) = _ContractReceiverSignedDto;

  factory ContractReceiverSignedDto.fromJson(Map<String, dynamic> json) =>
      _$ContractReceiverSignedDtoFromJson(json);
}
