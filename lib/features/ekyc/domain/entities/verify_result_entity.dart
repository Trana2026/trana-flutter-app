import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_result_entity.freezed.dart';

/// 신분증 진위확인 결과 (POST /v1/identity/verify-id-card 응답)
@freezed
abstract class VerifyResultEntity with _$VerifyResultEntity {
  const factory VerifyResultEntity({
    required String requestId,
    required bool verified,
  }) = _VerifyResultEntity;
}
