import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trana/core/error/dio_error_mapper.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/product_photos_entity.dart';
import 'package:trana/features/contract/domain/repositories/product_photos_repository.dart';

class ProductPhotosRepositoryImpl implements ProductPhotosRepository {
  ProductPhotosRepositoryImpl();

  @override
  Future<Result<void>> createProductPhotos(
    int contractId,
    List<Uint8List> photos,
  ) async {
    if (photos.isEmpty) return const Success(null);

    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ProductPhotosRepo] createProductPhotos: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ProductPhotosRepo] createProductPhotos unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }

  @override
  Future<Result<List<ProductPhotosEntity>>> readProductPhotos(
    int contractId,
  ) async {
    try {
      throw UnimplementedError();
    } on DioException catch (e) {
      debugPrint(
        '[ProductPhotosRepo] readProductPhotos: ${e.type} ${e.response?.statusCode} ${e.message}',
      );
      return Failure(e.toFailure());
    } catch (e) {
      debugPrint('[ProductPhotosRepo] readProductPhotos unexpected: $e');
      return const Failure(UnknownFailure());
    }
  }
}
