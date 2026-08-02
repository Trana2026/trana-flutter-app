import 'package:freezed_annotation/freezed_annotation.dart';

part 'adult_kyc_result_entity.freezed.dart';

/// 성인 KYC 최종 완료 결과 (POST /v1/identity/face-compare 응답)
@freezed
abstract class AdultKycResultEntity with _$AdultKycResultEntity {
  const factory AdultKycResultEntity({
    required String accessToken,
    required String refreshToken,
    required String publicCode,
    required bool requiresGuardian, // 성인은 항상 false
  }) = _AdultKycResultEntity;
}
