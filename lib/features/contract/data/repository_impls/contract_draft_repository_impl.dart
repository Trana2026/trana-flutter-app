import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/data_sources/contract_draft_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_draft_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/domain/repositories/contract_draft_repository.dart';

class ContractDraftRepositoryImpl implements ContractDraftRepository {
  const ContractDraftRepositoryImpl(this.dataSource);

  final ContractDraftDataSource dataSource;

  @override
  Future<Result<ContractDraftEntity>> createDraft() {
    return guardResult(
      () async {
        final dto = await dataSource.createDraft();
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const KycFailure('가입 보호자 인증이 완료되지 않아 계약을 생성할 수 없습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDraftEntity>> readDraft({required String publicCode}) {
    return guardResult(
      () async {
        final dto = await dataSource.readDraft(publicCode: publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('본인이 작성한 계약만 조회할 수 있습니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<void>> deleteDraft({required String publicCode}) {
    return guardResult(
      () {
        return dataSource.deleteDraft(publicCode);
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        409 => const ConflictFailure('DRAFT 상태에서만 삭제할 수 있습니다.'),
        410 => const GoneFailure('이미 삭제된 계약입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDraftEntity>> updateDraft({
    required String publicCode,
    String? title,
    int? price,
    String? conditionSummary,
    String? conditionDetails,
    DeliveryType? deliveryType,
    Role? creatorRole,
    String? tradingPlatform,
    int? warrantyPeriodDays,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.updateDraft(
          publicCode,
          title: title,
          price: price,
          conditionSummary: conditionSummary,
          conditionDetails: conditionDetails,
          deliveryType: deliveryType?.apiString,
          creatorRole: creatorRole?.apiString,
          tradingPlatform: tradingPlatform,
          warrantyPeriodDays: warrantyPeriodDays,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('본인이 작성한 계약만 수정할 수 있습니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        409 => const ConflictFailure('DRAFT 상태에서만 수정할 수 있습니다.'),
        _ => null,
      },
    );
  }
}
