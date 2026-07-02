import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_guardian_consent_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_guardian_consent_approve_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_guardian_consent_link_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_approve_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_guardian_consent_link_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_guardian_consent_repository.dart';

class ContractGuardianConsentRepositoryImpl
    implements ContractGuardianConsentRepository {
  const ContractGuardianConsentRepositoryImpl(this.dataSource);

  final ContractGuardianConsentDataSource dataSource;

  @override
  Future<Result<ContractGuardianConsentLinkEntity>> guardianConsent(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.guardianConsent(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ValidationFailure('보호자 동의가 불필요한 계약입니다.'));
      }
      if (e.response?.statusCode == 403) {
        return const Failure(
          ForbiddenFailure('본인이 작성한 계약만 보호자 동의 링크를 발급할 수 있습니다.'),
        );
      }
      if (e.response?.statusCode == 409) {
        return const Failure(
          ConflictFailure('DRAFT 상태이거나 이미 보호자 동의가 완료된 계약입니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractGuardianConsentApproveEntity>> approve({
    required String token,
  }) async {
    try {
      final dto = await dataSource.approve(token: token);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(
          ValidationFailure('토큰 purpose가 잘못되었거나 보호자 동의가 불필요한 계약입니다.'),
        );
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('이미 보호자 동의가 완료된 계약입니다.'));
      }
      if (e.response?.statusCode == 410) {
        return const Failure(GoneFailure('이미 사용되었거나 만료된 보호자 링크 토큰입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractGuardianConsentLinkEntity>> receiverGuardianConsent(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.receiverGuardianConsent(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ValidationFailure('보호자 동의가 불필요한 계약입니다.'));
      }
      if (e.response?.statusCode == 403) {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다'));
      }
      if (e.response?.statusCode == 409) {
        return const Failure(ConflictFailure('이미 보호자 동의가 완료된 계약입니다'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
