import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/utils/enum_extensions.dart';
import 'package:trana/features/terms/data/datasources/terms_remote_datasource.dart';
import 'package:trana/features/terms/data/models/consent_response_dto.dart';
import 'package:trana/features/terms/data/models/terms_content_dto.dart';
import 'package:trana/features/terms/data/models/terms_dto.dart';
import 'package:trana/features/terms/domain/entities/consent_result_entity.dart';
import 'package:trana/features/terms/domain/entities/terms_content_entity.dart';
import 'package:trana/features/terms/domain/entities/terms_entity.dart';
import 'package:trana/features/terms/domain/enums/terms_type.dart';
import 'package:trana/features/terms/domain/repositories/terms_repository.dart';

class TermsRepositoryImpl implements TermsRepository {
  final TermsRemoteDatasource _remote;
  TermsRepositoryImpl(this._remote);

  /// 활성 약관 목록 조회
  @override
  Future<Result<List<TermsEntity>>> getTerms() async {
    try {
      final dtos = await _remote.getTerms();
      return Success(dtos.map((e) => e.toEntity()).toList());
    } catch (e, st) {
      debugPrint('[TermsRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 약관 동의 및 signupSessionId 발급
  @override
  Future<Result<ConsentResultEntity>> submitConsent({
    required List<int> termsVersionIds,
    required String contextType,
    required String ageGroup,
  }) async {
    try {
      final dto = await _remote.submitConsent(
        termsVersionIds: termsVersionIds,
        contextType: contextType,
        ageGroup: ageGroup,
      );
      return Success(dto.toEntity());
    } catch (e, st) {
      debugPrint('[TermsRepo] error: $e\n$st');
      return Failure(const UnknownFailure());
    }
  }

  /// 계약 서명 필수 약관 목록 조회
  @override
  Future<Result<List<TermsEntity>>> readContractTerms() async {
    try {
      final dtos = await _remote.getContractTerms();
      return Success(dtos.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  /// 약관 전문 조회
  @override
  Future<Result<TermsContentEntity>> readTermContent(int id) async {
    try {
      final dto = await _remote.getTermContent(id);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }

  /// 타입별 약관 전문 조회
  @override
  Future<Result<TermsContentEntity>> readTermContentByType(
    TermsType type,
  ) async {
    try {
      final terms = await _remote.getTerms();
      final match = terms.where((t) => t.type == type.apiString).firstOrNull;
      if (match == null) {
        return const Failure(NotFoundFailure('약관을 찾을 수 없습니다.'));
      }
      final dto = await _remote.getTermContent(match.id);
      return Success(dto.toEntity());
    } on DioException catch (e) {
      return Failure(e.toFailure());
    } catch (e) {
      return const Failure(UnknownFailure());
    }
  }
}
