sealed class AppFailure {
  final String message;
  const AppFailure(this.message);
}

class NetworkFailure extends AppFailure {
  const NetworkFailure([super.message = '네트워크 오류가 발생했습니다.']);
}

class ServerFailure extends AppFailure {
  const ServerFailure([super.message = '서버 오류가 발생했습니다.']);
}

class UnauthorizedFailure extends AppFailure {
  const UnauthorizedFailure([super.message = '인증이 필요합니다.']);
}

class KycFailure extends AppFailure {
  const KycFailure(super.message);
}

class CacheFailure extends AppFailure {
  const CacheFailure([super.message = '로컬 저장 오류가 발생했습니다.']);
}

class ForbiddenFailure extends AppFailure {
  const ForbiddenFailure([super.message = '접근 권한이 없습니다.']);
}

class ConflictFailure extends AppFailure {
  const ConflictFailure([super.message = '현재 상태에서 수행할 수 없는 작업입니다.']);
}

class GoneFailure extends AppFailure {
  const GoneFailure([super.message = '이미 삭제된 항목입니다.']);
}

class NotFoundFailure extends AppFailure {
  const NotFoundFailure([super.message = '존재하지 않거나 삭제된 항목입니다.']);
}

class ValidationFailure extends AppFailure {
  const ValidationFailure([super.message = '요청 값이 올바르지 않습니다.']);
}

class UnknownFailure extends AppFailure {
  const UnknownFailure([super.message = '알 수 없는 오류가 발생했습니다.']);
}
