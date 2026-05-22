import 'dart:typed_data';

import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/product_photos_entity.dart';

abstract interface class ProductPhotosRepository {
  /// 거래 사진 업로드 (다중)
  Future<Result<void>> createProductPhotos(
    int contractId,
    List<Uint8List> photos,
  );

  /// 거래 사진 목록 조회
  Future<Result<List<ProductPhotosEntity>>> readProductPhotos(int contractId);
}
