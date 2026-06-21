import 'package:trana/features/guardian/data/models/guardian_link_dto.dart';

/// 보호자 인증 API 호출 인터페이스
abstract interface class GuardianRemoteDatasource {
  /// POST /v1/guardian/links
  Future<GuardianLinkDto> createGuardianLink();
}
