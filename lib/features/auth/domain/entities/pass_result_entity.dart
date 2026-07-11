import 'package:freezed_annotation/freezed_annotation.dart';

part 'pass_result_entity.freezed.dart';

/// PASS 본인확인 성공 결과
@freezed
abstract class PassResultEntity with _$PassResultEntity {
  const factory PassResultEntity({
    required String accessToken,
    required String refreshToken,
    required String publicCode,
    required bool requiresGuardian,
  }) = _PassResultEntity;
}
