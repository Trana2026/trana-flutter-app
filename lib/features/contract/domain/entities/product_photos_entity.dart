import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_photos_entity.freezed.dart';

/// 거래 사진
@freezed
abstract class ProductPhotosEntity with _$ProductPhotosEntity {
  const factory ProductPhotosEntity({
    int? id,
    required int contractID, // 계약 ID
    required String s3Key, // 사진 S3 경로
    required int displayOrder, // 표시 순서
    required DateTime createdAt,

    // required String contentHash, // 사진해시
  }) = _ProductPhotosEntity;
}
