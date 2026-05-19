import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_photos_entity.freezed.dart';

/// 거래 사진
@freezed
abstract class ProductPhotosEntity with _$ProductPhotosEntity {
  const factory ProductPhotosEntity({
    int? id,
    required int contractID, // 계약 ID
    required Uint8List photoBytes, // 사진 bytes
    required DateTime createdAt,

    // required String s3Key, // S3 경로
    // required String contentHash, // 사진해시
    // required int displayOrder, // 표시 순서
  }) = _ProductPhotosEntity;
}
