import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
  Future<Result<ContractGuardianConsentLinkEntity>> createLink(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.createLink(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[GuardianConsentRepo] createLink: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_400_CONSENT_TYPE') {
        return const Failure(ValidationFailure('보호자 동의가 불필요한 계약입니다.'));
      }
      if (errorCode == 'CONTRACT_403_OWNER') {
        return const Failure(ForbiddenFailure('본인이 작성한 계약만 보호자 동의 링크를 발급할 수 있습니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_DRAFT') {
        return const Failure(ConflictFailure('DRAFT 상태이거나 이미 보호자 동의가 완료된 계약입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[GuardianConsentRepo] createLink unexpected: $e');
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
      debugPrint(
        '[GuardianConsentRepo] approve: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_400_CONSENT_TYPE') {
        return const Failure(ValidationFailure('토큰 purpose가 잘못되었거나 보호자 동의가 불필요한 계약입니다.'));
      }
      if (errorCode == 'CONTRACT_409_GUARDIAN_ALREADY') {
        return const Failure(ConflictFailure('이미 보호자 동의가 완료된 계약입니다.'));
      }
      if (errorCode == 'GUARDIAN_LINK_INVALID') {
        return const Failure(GoneFailure('이미 사용되었거나 만료된 보호자 링크 토큰입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[GuardianConsentRepo] approve unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  String? _errorCode(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) return data['code'] as String?;
    return null;
  }
}
