import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/user_info_entity.dart';

abstract interface class UserInfoRepository {
  Future<Result<UserInfoEntity>> readUser();

  Future<Result<void>> withdraw();
}
