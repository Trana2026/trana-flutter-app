import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/dtos/contract_dto.dart';
import 'package:trana/features/contract/domain/entities/contract_entity.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/contract/domain/enums/role.dart';

extension ContractMapper on ContractDto {
  ContractEntity toEntity() {
    return ContractEntity(
      publicCode: publicCode,
      status: ContractStatus.values.fromApiString(
        status,
        fallback: ContractStatus.inProgress,
      ),
      title: title,
      price: price,
      isCreator: isCreator,
      myRole: Role.values.tryFromApiString(myRole),
      attachmentCount: attachmentCount,
      firstAttachmentUrl: firstAttachmentUrl,
      updatedAt: updatedAt,
    );
  }
}
