import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/profile/data/datasources/user_info_data_source.dart';
import 'package:trana/features/profile/data/mappers/user_info_mapper.dart';
import 'package:trana/features/profile/domain/entities/user_info_entity.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';
import 'package:trana/features/profile/domain/repositories/user_info_repository.dart';

class UserInfoRepositoryImpl implements UserInfoRepository {
  const UserInfoRepositoryImpl(this.dataSource);

  final UserInfoDataSource dataSource;

  @override
  Future<Result<UserInfoEntity>> updateProfile({
    String? email,
    Gender? gender,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.patchProfile(
          email: email,
          gender: gender?.apiString,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('입력값 검증에 실패했습니다.'),
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        404 => const NotFoundFailure('사용자를 찾을 수 없습니다.'),
        409 => const ConflictFailure('이미 사용 중인 이메일입니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<UserInfoEntity>> readUser() {
    return guardResult(
      () async {
        final dto = await dataSource.getMe();
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        404 => const NotFoundFailure('사용자를 찾을 수 없습니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<void>> withdraw() {
    return guardResult(
      () {
        return dataSource.deleteMe();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        401 => const UnauthorizedFailure('잘못된 토큰입니다.'),
        404 => const NotFoundFailure('사용자를 찾을 수 없습니다.'),
        409 => const ConflictFailure('이미 탈퇴한 사용자입니다.'),
        _ => null,
      },
    );
  }
}
