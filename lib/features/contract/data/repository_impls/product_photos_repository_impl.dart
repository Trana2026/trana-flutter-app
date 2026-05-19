import 'dart:io';

import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/product_photos_entity.dart';
import 'package:trana/features/contract/domain/repositories/product_photos_repository.dart';

class ProductPhotosRepositoryImpl implements ProductPhotosRepository {
  @override
  Future<Result<void>> createProductPhotos(
    List<ProductPhotosEntity>? photos,
  ) async {
    try {
      // TODO: implement createProductPhotos
      throw UnimplementedError();
    } on SocketException {
      return const Failure(NetworkFailure());
    } on UnauthorizedFailure {
      return const Failure(UnauthorizedFailure());
    } catch (e) {
      return Failure(UnknownFailure('거래 사진 저장 실패: $e'));
    }
  }
}
