import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/terms/domain/enums/terms_type.dart';

part 'terms_content_entity.freezed.dart';

/// 약관 전문
@freezed
abstract class TermsContentEntity with _$TermsContentEntity {
  const factory TermsContentEntity({
    required int id,
    required TermsType type,
    required String version,
    required String title,
    required String contentHash,
    required String content,
    required DateTime effectiveAt,
  }) = _TermsContentEntity;
}
