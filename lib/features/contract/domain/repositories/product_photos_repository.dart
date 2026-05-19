import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/product_photos_entity.dart';

abstract interface class ProductPhotosRepository {
  /// 거래 사진 생성 (다중)
  Future<Result<void>> createProductPhotos(List<ProductPhotosEntity>? photos);
}
