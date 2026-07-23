import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/ekyc/data/models/terms_dto.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/profile/data/datasources/term_data_source.dart';
import 'package:trana/features/profile/data/dtos/terms_content_dto.dart';
import 'package:trana/features/profile/domain/entities/terms_content_entity.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';
import 'package:trana/features/profile/domain/repositories/term_repository.dart';

class TermRepositoryImpl implements TermRepository {
  const TermRepositoryImpl(this.dataSource);

  final TermDataSource dataSource;

  @override
  Future<Result<TermsContentEntity>> readTermContent(int id) async {
    try {
      final dto = await dataSource.getTermContent(id);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<TermsContentEntity>> readTermContentByType(
    TermsType type,
  ) async {
    try {
      final terms = await dataSource.getActiveTerms();
      final match = terms
          .where((t) => t.type == type.apiString)
          .firstOrNull;
      if (match == null) {
        return const Failure(NotFoundFailure('약관을 찾을 수 없습니다.'));
      }
      final dto = await dataSource.getTermContent(match.id);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<TermsEntity>>> readContractTerms() async {
    try {
      final dtos = await dataSource.getContractTerms();
      return Success(dtos.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
