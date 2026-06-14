import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_pdf_entity.freezed.dart';

@freezed
abstract class ContractPdfEntity with _$ContractPdfEntity {
  const factory ContractPdfEntity({
    required String downloadUrl,
    required int expiresInSeconds,
    required String sha256,
  }) = _ContractPdfEntity;
}
