import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/profile/data/dtos/user_consent_dto.dart';
import 'package:trana/features/profile/domain/entities/user_consent_entity.dart';
import 'package:trana/features/terms/domain/enums/terms_type.dart';

extension UserConsentMapper on UserConsentDto {
  UserConsentEntity toEntity() {
    return UserConsentEntity(
      termsId: termsId,
      type: TermsType.values.fromApiString(type, fallback: TermsType.service),
      version: version,
      title: title,
      agreedAt: agreedAt,
    );
  }
}
