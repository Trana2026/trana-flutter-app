import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/profile/data/datasources/user_inquiry_data_source.dart';
import 'package:trana/features/profile/data/mappers/user_inquiry_mapper.dart';
import 'package:trana/features/profile/domain/entities/user_inquiry_entity.dart';
import 'package:trana/features/profile/domain/repositories/user_inquiry_repository.dart';

class UserInquiryRepositoryImpl implements UserInquiryRepository {
  const UserInquiryRepositoryImpl(this.dataSource);

  final UserInquiryDataSource dataSource;

  @override
  Future<Result<List<UserInquiryEntity>>> readInquiries() {
    return guardResult(
      () async {
        final dtos = await dataSource.getInquiries();
        return dtos.map((dto) => dto.toEntity()).toList();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        401 => const UnauthorizedFailure('인증이 필요합니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<UserInquiryEntity>> createInquiry({
    required String email,
    required String title,
    required String content,
  }) {
    return guardResult(
      () async {
        final dto = await dataSource.postInquiry(
          email: email,
          title: title,
          content: content,
        );
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        400 => const ValidationFailure('입력값 검증에 실패했습니다.'),
        401 => const UnauthorizedFailure('인증이 필요합니다.'),
        _ => null,
      },
    );
  }

  @override
  Future<Result<UserInquiryEntity>> readInquiryDetail(String publicCode) {
    return guardResult(
      () async {
        final dto = await dataSource.getInquiryDetail(publicCode);
        return dto.toEntity();
      },
      onDioException: (e) => switch (e.response?.statusCode) {
        401 => const UnauthorizedFailure('인증이 필요합니다.'),
        404 => const NotFoundFailure('문의를 찾을 수 없습니다.'),
        _ => null,
      },
    );
  }
}
