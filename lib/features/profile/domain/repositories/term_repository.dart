import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/profile/domain/entities/terms_content_entity.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';

abstract interface class TermRepository {
  /// 약관 전문 조회
  Future<Result<TermsContentEntity>> readTermContent(int id);

  /// 타입별 약관 전문 조회
  Future<Result<TermsContentEntity>> readTermContentByType(TermsType type);

  /// 계약 서명 필수 약관 목록 조회
  Future<Result<List<TermsEntity>>> readContractTerms();
}
