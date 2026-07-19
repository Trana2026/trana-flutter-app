import 'package:dio/dio.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/ekyc/data/models/terms_dto.dart';
import 'package:trana/features/ekyc/domain/entities/terms_entity.dart';
import 'package:trana/features/profile/data/datasources/term_data_source.dart';
import 'package:trana/features/profile/domain/enums/terms_type.dart';
import 'package:trana/features/profile/domain/repositories/term_repository.dart';

class TermRepositoryImpl implements TermRepository {
  const TermRepositoryImpl(this.dataSource);

  final TermDataSource dataSource;

  @override
  Future<Result<TermsEntity>> readTermByType(TermsType type) async {
    try {
      final dto = await dataSource.getTermByType(type.apiString);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
