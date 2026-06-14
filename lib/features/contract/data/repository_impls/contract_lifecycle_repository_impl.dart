import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_lifecycle_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_draft_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_signed_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_signed_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_lifecycle_repository.dart';

class ContractLifecycleRepositoryImpl implements ContractLifecycleRepository {
  const ContractLifecycleRepositoryImpl(this.dataSource);

  final ContractLifecycleDataSource dataSource;

  @override
  Future<Result<ContractDraftEntity>> fromReadyToShared({
    required String publicCode,
    required String receiverName,
    required String receiverPhone,
  }) async {
    try {
      final dto = await dataSource.fromReadyToShared(
        publicCode,
        receiverName: receiverName,
        receiverPhone: receiverPhone,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[LifecycleRepo] fromReadyToShared: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'VALIDATION_FAILED') {
        return const Failure(ValidationFailure('이름 또는 전화번호 형식이 올바르지 않습니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_READY') {
        return const Failure(ConflictFailure('READY 상태에서만 공유할 수 있습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[LifecycleRepo] fromReadyToShared unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDraftEntity>> fromReadyToDraft(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.fromReadyToDraft(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[LifecycleRepo] fromReadyToDraft: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_409_NOT_READY') {
        return const Failure(ConflictFailure('READY 상태에서만 되돌릴 수 있습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[LifecycleRepo] fromReadyToDraft unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractDraftEntity>> fromDraftToReady(
    String publicCode,
  ) async {
    try {
      final dto = await dataSource.fromDraftToReady(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[LifecycleRepo] fromDraftToReady: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_400_NOT_READY') {
        return const Failure(ValidationFailure('필수 필드가 누락되어 READY 전이가 불가합니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_DRAFT') {
        return const Failure(ConflictFailure('DRAFT 상태이거나 보호자 동의가 미완료입니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[LifecycleRepo] fromDraftToReady unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<ContractSignedEntity>> fromReceiverSignedToSigned({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  }) async {
    try {
      final dto = await dataSource.fromReceiverSignedToSigned(
        publicCode,
        signatureBase64: signatureBase64,
        agreedTermIds: agreedTermIds,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      debugPrint(
        '[LifecycleRepo] fromReceiverSignedToSigned: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      final errorCode = _errorCode(e);
      if (errorCode == 'CONTRACT_400_TERMS') {
        return const Failure(ValidationFailure('약관 ID가 누락되었거나 일치하지 않습니다.'));
      }
      if (errorCode == 'CONTRACT_403_OWNER') {
        return const Failure(ForbiddenFailure('생성자 본인이 아니거나 수신자 KYC가 미완료입니다.'));
      }
      if (errorCode == 'CONTRACT_404') {
        return const Failure(NotFoundFailure('계약을 찾을 수 없습니다.'));
      }
      if (errorCode == 'CONTRACT_409_NOT_RECEIVER_SIGNED') {
        return const Failure(
          ConflictFailure('RECEIVER_SIGNED 상태에서만 서명할 수 있습니다.'),
        );
      }
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[LifecycleRepo] fromReceiverSignedToSigned unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  String? _errorCode(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) return data['code'] as String?;
    return null;
  }
}
