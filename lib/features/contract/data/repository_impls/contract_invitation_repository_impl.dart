import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_invitation_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_draft_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_receiver_signed_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_receiver_signed_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_invitation_repository.dart';

class ContractInvitationRepositoryImpl implements ContractInvitationRepository {
  const ContractInvitationRepositoryImpl(this.dataSource);

  final ContractInvitationDataSource dataSource;

  @override
  Future<Result<ContractDraftEntity>> requestRevision({
    required String publicCode,
    String? titleReason,
    String? priceReason,
    String? conditionSummaryReason,
    String? conditionDetailsReason,
  }) async {
    try {
      final dto = await dataSource.requestRevision(
        publicCode,
        titleReason: titleReason,
        priceReason: priceReason,
        conditionSummaryReason: conditionSummaryReason,
        conditionDetailsReason: conditionDetailsReason,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[InvitationRepo] requestRevision: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'VALIDATION_FAILED') {
        return const Failure(ValidationFailure('최소 1개 필드의 수정 이유를 입력해야 합니다.'));
      }
      if (errorCode == 'CONTRACT_403_NOT_ACCESSIBLE') {
        return const Failure(ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'));
      }
      if (errorCode == 'CONTRACT_404') {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_SHARED') {
        return const Failure(ConflictFailure('SHARED 상태에서만 수정 요청이 가능합니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[InvitationRepo] requestRevision unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractReceiverSignedEntity>> receiverSign({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  }) async {
    try {
      final dto = await dataSource.receiverSign(
        publicCode,
        signatureBase64: signatureBase64,
        agreedTermIds: agreedTermIds,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[InvitationRepo] receiverSign: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_400_TERMS') {
        return const Failure(ValidationFailure('동의하지 않은 약관이 있습니다.'));
      }
      if (errorCode == 'CONTRACT_403_NOT_RECEIVER') {
        return const Failure(ForbiddenFailure('수신자만 서명할 수 있습니다.'));
      }
      if (errorCode == 'CONTRACT_404') {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_SHARED') {
        return const Failure(ConflictFailure('SHARED 상태에서만 서명이 가능합니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[InvitationRepo] receiverSign unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDraftEntity>> acceptInvitation(String token) async {
    try {
      final dto = await dataSource.acceptInvitation(token);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[InvitationRepo] acceptInvitation: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_404_INVITATION_NOT_FOUND') {
        return const Failure(NotFoundFailure('초대 토큰을 찾을 수 없습니다.'));
      }
      if (errorCode == 'CONTRACT_410_INVITATION_EXPIRED') {
        return const Failure(GoneFailure('이미 사용되었거나 만료된 초대 토큰입니다.'));
      }
      if (errorCode == 'CONTRACT_403_NOT_ACCESSIBLE') {
        return const Failure(ForbiddenFailure('생성자 본인이 자기 계약을 수락할 수 없습니다.'));
      }
      if (errorCode == 'CONTRACT_403_USER_NOT_READY') {
        return const Failure(KycFailure('가입이 완료되지 않은 사용자입니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_SHARED') {
        return const Failure(ConflictFailure('계약이 SHARED 상태가 아닙니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[InvitationRepo] acceptInvitation unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  String? _errorCode(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) return data['code'] as String?;
    return null;
  }
}
