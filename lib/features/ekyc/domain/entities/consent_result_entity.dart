import 'package:freezed_annotation/freezed_annotation.dart';

part 'consent_result_entity.freezed.dart';

/// 약관 동의 결과 (POST /v1/consents 응답)
@freezed
abstract class ConsentResultEntity with _$ConsentResultEntity {
  const factory ConsentResultEntity({
    String? signupSessionId, // 성인 가입 흐름에서만 발급, 이후 OCR 요청에 사용
  }) = _ConsentResultEntity;
}
