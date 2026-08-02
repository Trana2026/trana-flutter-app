import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trana/features/terms/domain/enums/terms_type.dart';

part 'user_consent_entity.freezed.dart';

@freezed
abstract class UserConsentEntity with _$UserConsentEntity {
  const factory UserConsentEntity({
    required int termsId,
    required TermsType type,
    required String version,
    required String title,
    required DateTime agreedAt,
  }) = _UserConsentEntity;
}
