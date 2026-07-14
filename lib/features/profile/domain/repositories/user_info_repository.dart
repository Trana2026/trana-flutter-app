import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/domain/entities/user_info_entity.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';

abstract interface class UserInfoRepository {
  Future<Result<UserInfoEntity>> updateProfile({String? email, Gender? gender});

  Future<Result<UserInfoEntity>> readUser();

  Future<Result<void>> withdraw();
}
