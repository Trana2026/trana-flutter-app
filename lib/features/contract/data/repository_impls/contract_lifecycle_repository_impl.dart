import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_lifecycle_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_confirm_completion_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_draft_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_signed_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_confirm_completion_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_signed_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_lifecycle_repository.dart';

class ContractLifecycleRepositoryImpl implements ContractLifecycleRepository {
  const ContractLifecycleRepositoryImpl(this.dataSource);

  final ContractLifecycleDataSource dataSource;

  @override
  Future<Result<ContractDraftEntity>> share({
    required String publicCode,
    required String receiverName,
    required String receiverPhone,
  }) async {
    try {
      final dto = await dataSource.share(
        publicCode,
        receiverName: receiverName,
        receiverPhone: receiverPhone,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ValidationFailure('이름 또는 전화번호 형식이 올바르지 않습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('READY 상태에서만 공유할 수 있습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDraftEntity>> revert(String publicCode) async {
    try {
      final dto = await dataSource.revert(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('READY 상태에서만 되돌릴 수 있습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDraftEntity>> reshare(String publicCode) async {
    try {
      final dto = await dataSource.reshare(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('현재 SIGNED 상태가 아닙니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDraftEntity>> ready(String publicCode) async {
    try {
      final dto = await dataSource.ready(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ValidationFailure('필수 필드가 누락되어 READY 전이가 불가합니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('DRAFT 상태이거나 보호자 동의가 미완료입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractSignedEntity>> creatorSign({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  }) async {
    try {
      final dto = await dataSource.creatorSign(
        publicCode,
        signatureBase64: signatureBase64,
        agreedTermIds: agreedTermIds,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ValidationFailure('약관 ID가 누락되었거나 일치하지 않습니다.'));
      }
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('생성자 본인이 아니거나 수신자 KYC가 미완료입니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(
          ConflictFailure('RECEIVER_SIGNED 상태에서만 서명할 수 있습니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractConfirmCompletionEntity>> confirmCompletion(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.confirmCompletion(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('SIGNED 상태에서만 거래 완료 확인이 가능합니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
