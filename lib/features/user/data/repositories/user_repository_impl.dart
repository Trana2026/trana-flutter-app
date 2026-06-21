import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/user/data/datasources/user_remote_datasource.dart';
import 'package:trana/features/user/data/models/user_me_dto.dart';
import 'package:trana/features/user/domain/entities/user_me_entity.dart';
import 'package:trana/features/user/domain/repositories/user_repository.dart';

/// UserRepository 구현체
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource _remote;

  const UserRepositoryImpl(this._remote);

  /// 현재 사용자 정보 조회
  @override
  Future<Result<UserMeEntity>> getMe() async {
    try {
      final dto = await _remote.getMe();
      return Success(dto.toEntity());
    } on AppFailure catch (failure) {
      return Failure(failure);
    } catch (_) {
      return Failure(const UnknownFailure());
    }
  }
}
