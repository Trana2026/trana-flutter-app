import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/contract/data/data_sources/contract_draft_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_draft_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/enums/consent_type.dart';
import 'package:trana/features/contract/domain/enums/delivery_type.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/domain/repositories/contract_draft_repository.dart';

class ContractDraftRepositoryImpl implements ContractDraftRepository {
  const ContractDraftRepositoryImpl(this.dataSource);

  final ContractDraftDataSource dataSource;

  @override
  Future<Result<ContractDraftEntity>> createDraft({
    DeliveryType? deliveryType,
    Role? creatorRole,
    ConsentType? consentType,
  }) async {
    try {
      final dto = await dataSource.createDraft(
        deliveryType: deliveryType?.apiString,
        creatorRole: creatorRole?.apiString,
        consentType: consentType?.apiString,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(KycFailure('가입 보호자 인증이 완료되지 않아 계약을 생성할 수 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDraftEntity>> readDraft({
    required String publicCode,
  }) async {
    try {
      final dto = await dataSource.readDraft(publicCode: publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('본인이 작성한 계약만 조회할 수 있습니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<void>> deleteDraft({required String publicCode}) async {
    try {
      await dataSource.deleteDraft(publicCode);
      return const Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('DRAFT 상태에서만 삭제할 수 있습니다.'));
      }
      if (e.response?.statusCode == 410) {
        return const Failure(GoneFailure('이미 삭제된 계약입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
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
  }) async {
    try {
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
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('본인이 작성한 계약만 수정할 수 있습니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('DRAFT 상태에서만 수정할 수 있습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
