import 'package:freezed_annotation/freezed_annotation.dart';

part 'guardian_link_entity.freezed.dart';

/// 보호자 인증 링크 정보 (POST /v1/guardian/links 응답)
@freezed
abstract class GuardianLinkEntity with _$GuardianLinkEntity {
  const factory GuardianLinkEntity({
    required String token, // jnanoid 21자, 일회용
    required DateTime expiresAt,
    required String verifyUrl, // 보호자에게 공유할 URL
  }) = _GuardianLinkEntity;
}
