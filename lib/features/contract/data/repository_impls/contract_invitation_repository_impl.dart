import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/data_sources/contract_invitation_data_source.dart';
import 'package:trana/features/contract/data/mappers/contract_draft_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_receiver_signed_mapper.dart';
import 'package:trana/features/contract/data/mappers/contract_revision_reason_mapper.dart';
import 'package:trana/features/contract/domain/entities/contract_draft_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_receiver_signed_entity.dart';
import 'package:trana/features/contract/domain/entities/contract_revision_reason_entity.dart';
import 'package:trana/features/contract/domain/repositories/contract_invitation_repository.dart';

class ContractInvitationRepositoryImpl implements ContractInvitationRepository {
  const ContractInvitationRepositoryImpl(this.dataSource);

  final ContractInvitationDataSource dataSource;

  @override
  Future<Result<ContractDraftEntity>> revisions({
    required String publicCode,
    String? deliveryTypeReason,
    String? tradingPlatformReason,
    String? titleReason,
    String? priceReason,
    String? conditionSummaryReason,
    String? conditionDetailsReason,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.revisions(
          publicCode,
          deliveryTypeReason: deliveryTypeReason,
          tradingPlatformReason: tradingPlatformReason,
          titleReason: titleReason,
          priceReason: priceReason,
          conditionSummaryReason: conditionSummaryReason,
          conditionDetailsReason: conditionDetailsReason,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('최소 1개 필드의 수정 이유를 입력해야 합니다.'),
        403 => const ForbiddenFailure('이 계약에 접근할 권한이 없습니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        409 => const ConflictFailure('SHARED 상태에서만 수정 요청이 가능합니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractReceiverSignedEntity>> receiverSign({
    required String publicCode,
    required String signatureBase64,
    required List<int> agreedTermIds,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.receiverSign(
          publicCode,
          signatureBase64: signatureBase64,
          agreedTermIds: agreedTermIds,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('동의하지 않은 약관이 있습니다.'),
        403 => const ForbiddenFailure('수신자만 서명할 수 있습니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        409 => const ConflictFailure('SHARED 상태에서만 서명이 가능합니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDraftEntity>> acceptInvitation(String token) {
    return guardResult(
      () async {
        final dto = await dataSource.acceptInvitation(token);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('생성자 본인이거나 가입이 완료되지 않은 사용자입니다.'),
        404 => const NotFoundFailure('초대 토큰을 찾을 수 없습니다.'),
        409 => const ConflictFailure('계약이 SHARED 상태가 아닙니다.'),
        410 => const GoneFailure('이미 사용되었거나 만료된 초대 토큰입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractDraftEntity>> receiverWarranty({
    required String publicCode,
    required int warrantyPeriodDays,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.receiverWarranty(
          publicCode,
          warrantyPeriodDays: warrantyPeriodDays,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('수신자(판매자)만 보증기간을 변경할 수 있습니다.'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        409 => const ConflictFailure('SHARED 상태에서만 보증기간 변경이 가능합니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<ContractRevisionReasonEntity>> latest({
    required String publicCode,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.latest(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        403 => const ForbiddenFailure('이 계약에 접근할 권한이 없습니다'),
        404 => const NotFoundFailure('계약을 찾을 수 없습니다.'),
        _ => null,
      },
    );
  }
}
