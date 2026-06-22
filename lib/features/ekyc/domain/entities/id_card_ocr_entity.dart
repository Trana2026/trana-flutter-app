import 'package:freezed_annotation/freezed_annotation.dart';

part 'id_card_ocr_entity.freezed.dart';

/// 신분증 OCR 결과 (POST /v1/identity/id-card 응답)
@freezed
abstract class IdCardOcrEntity with _$IdCardOcrEntity {
  const factory IdCardOcrEntity({
    required String requestId, // 이후 요청에 계속 전달, 절대 새로 생성 금지
    required String idType, // ID_CARD | DRIVER_LICENSE | ALIEN_REGISTRATION
    required String name,
    required String birthDate, // "1990-01-01"
    required String gender, // MALE | FEMALE
  }) = _IdCardOcrEntity;
}
