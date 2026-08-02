import 'package:trana/features/terms/data/models/consent_response_dto.dart';
import 'package:trana/features/terms/data/models/terms_content_dto.dart';
import 'package:trana/features/terms/data/models/terms_dto.dart';

/// 약관/동의 API 호출 datasource 인터페이스
abstract interface class TermsRemoteDatasource {
  /// 약관 목록 조회
  Future<List<TermsDto>> getTerms();

  /// 약관 동의 제출
  Future<ConsentResponseDto> submitConsent({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  });

  /// 계약 서명 필수 약관 조회
  Future<List<TermsDto>> getContractTerms();

  /// 약관 전문 조회
  Future<TermsContentDto> getTermContent(int id);
}
