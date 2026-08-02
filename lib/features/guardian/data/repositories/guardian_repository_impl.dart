import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/guardian/data/datasources/guardian_remote_datasource.dart';
import 'package:trana/features/guardian/data/models/guardian_link_dto.dart';
import 'package:trana/features/guardian/domain/entities/guardian_link_entity.dart';
import 'package:trana/features/guardian/domain/repositories/guardian_repository.dart';

class GuardianRepositoryImpl implements GuardianRepository {
  final GuardianRemoteDatasource _remote;
  const GuardianRepositoryImpl(this._remote);

  /// 보호자 인증 링크 발급
  @override
  Future<Result<GuardianLinkEntity>> createGuardianLink() async {
    try {
      final dto = await _remote.createGuardianLink();
      return Success(dto.toEntity());
    } catch (_) {
      return Failure(const UnknownFailure());
    }
  }
}
