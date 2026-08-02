import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_entity.freezed.dart';

/// 활성 약관 항목 (GET /v1/terms 응답)
@freezed
abstract class TermsEntity with _$TermsEntity {
  const factory TermsEntity({
    required int id,
    required String type, // SERVICE | PRIVACY | MARKETING | LOCATION
    required String version,
    required String title,
    required String contentUrl,
    required DateTime effectiveAt,
  }) = _TermsEntity;
}
