import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
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
  Future<Result<List<UserInquiryEntity>>> readInquiries() async {
    try {
      final dtos = await dataSource.getInquiries();
      return Success(dtos.map((dto) => dto.toEntity()).toList());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(UnauthorizedFailure('인증이 필요합니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<UserInquiryEntity>> createInquiry({
    required String email,
    required String title,
    required String content,
  }) async {
    try {
      final dto = await dataSource.postInquiry(
        email: email,
        title: title,
        content: content,
      );
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return const Failure(ValidationFailure('입력값 검증에 실패했습니다.'));
      }
      if (e.response?.statusCode == 401) {
        return const Failure(UnauthorizedFailure('인증이 필요합니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<UserInquiryEntity>> readInquiryDetail(String publicCode) async {
    try {
      final dto = await dataSource.getInquiryDetail(publicCode);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Failure(UnauthorizedFailure('인증이 필요합니다.'));
      }
      if (e.response?.statusCode == 404) {
        return const Failure(NotFoundFailure('문의를 찾을 수 없습니다.'));
      }
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
