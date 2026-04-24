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

class UnknownFailure extends AppFailure {
  const UnknownFailure([super.message = '알 수 없는 오류가 발생했습니다.']);
}
