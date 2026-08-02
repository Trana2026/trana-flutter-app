import 'package:trana/core/error/result.dart';
import 'package:trana/features/terms/domain/entities/consent_result_entity.dart';
import 'package:trana/features/terms/domain/entities/terms_content_entity.dart';
import 'package:trana/features/terms/domain/entities/terms_entity.dart';
import 'package:trana/features/terms/domain/enums/terms_type.dart';

/// 약관/동의 데이터 접근 인터페이스
abstract interface class TermsRepository {
  /// 활성 약관 목록 조회
  Future<Result<List<TermsEntity>>> getTerms();

  /// 약관 동의 및 signupSessionId 발급
  Future<Result<ConsentResultEntity>> submitConsent({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  });

  /// 계약 서명 필수 약관 목록 조회
  Future<Result<List<TermsEntity>>> readContractTerms();

  /// 약관 전문 조회
  Future<Result<TermsContentEntity>> readTermContent(int id);

  /// 타입별 약관 전문 조회
  Future<Result<TermsContentEntity>> readTermContentByType(TermsType type);
}
