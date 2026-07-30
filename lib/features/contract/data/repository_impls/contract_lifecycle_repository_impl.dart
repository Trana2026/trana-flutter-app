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
    required String receiverCode,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.share(
          publicCode,
          receiverCode: receiverCode,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('고유코드를 확인해주세요.'),
        404 => const NotFoundFailure('해당 고유코드의 사용자를 찾을 수 없습니다.'),
        409 => const ConflictFailure('READY 상태에서만 공유할 수 있습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDraftEntity>> revert(String publicCode) {
    return guardResult(
      () async {
        final dto = await dataSource.revert(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        409 => const ConflictFailure('READY 상태에서만 되돌릴 수 있습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDraftEntity>> reshare(String publicCode) {
    return guardResult(
      () async {
        final dto = await dataSource.reshare(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        409 => const ConflictFailure('현재 SIGNED 상태가 아닙니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDraftEntity>> ready(String publicCode) {
    return guardResult(
      () async {
        final dto = await dataSource.ready(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('필수 필드가 누락되어 READY 전이가 불가합니다.'),
        409 => const ConflictFailure('DRAFT 상태이거나 보호자 동의가 미완료입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractSignedEntity>> creatorSign({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.creatorSign(
          publicCode,
          signatureBase64: signatureBase64,
          agreedTermIds: agreedTermIds,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('약관 ID가 누락되었거나 일치하지 않습니다.'),
        403 => const ForbiddenFailure('생성자 본인이 아니거나 수신자 KYC가 미완료입니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        409 => const ConflictFailure('RECEIVER_SIGNED 상태에서만 서명할 수 있습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractConfirmCompletionEntity>> confirmCompletion(
    String publicCode,
  ) {
    return guardResult(
      () async {
        final dto = await dataSource.confirmCompletion(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        409 => const ConflictFailure('SIGNED 상태에서만 거래 완료 확인이 가능합니다.'),
        _ => null,
      },
    );
  }
}
