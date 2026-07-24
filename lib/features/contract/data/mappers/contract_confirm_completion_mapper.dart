import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/dtos/contract_confirm_completion_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_confirm_completion_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

extension ContractConfirmCompletionMapper on ContractConfirmCompletionDto {
  ContractConfirmCompletionEntity toEntity() {
    return ContractConfirmCompletionEntity(
      publicCode: publicCode,
      status: ContractStatus.values.fromApiString(status, fallback: ContractStatus.inProgress),
      sellerCompletedAt: sellerCompletedAt,
      buyerCompletedAt: buyerCompletedAt,
      completedAt: completedAt,
    );
  }
}
