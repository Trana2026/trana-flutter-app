import 'dart:typed_data';

import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/domain/entities/product_photos_entity.dart';
import 'package:trana/features/contract/domain/repositories/product_photos_repository.dart';

/// 인메모리 저장소로 ProductPhotosRepository CRUD 를 테스트하는 Fake 구현체
class FakeProductPhotosRepositoryImpl implements ProductPhotosRepository {
  final _store = <int, List<ProductPhotosEntity>>{};
  int _nextId = 1;

  @override
  Future<Result<void>> createProductPhotos(
    int contractId,
    List<Uint8List> photos,
  ) async {
    if (photos.isEmpty) return const Success(null);
    final now = DateTime.now();
    final existing = _store[contractId] ?? [];
    final baseOrder = existing.isEmpty ? 0 : existing.last.displayOrder + 1;
    final entities = photos.asMap().entries.map((entry) {
      final id = _nextId++;
      return ProductPhotosEntity(
        id: id,
        contractID: contractId,
        s3Key: 'fake/contracts/$contractId/photo_${entry.key}.jpg',
        displayOrder: baseOrder + entry.key,
        createdAt: now,
      );
    }).toList();
    _store.putIfAbsent(contractId, () => []).addAll(entities);
    return const Success(null);
  }

  @override
  Future<Result<List<ProductPhotosEntity>>> readProductPhotos(
    int contractId,
  ) async {
    final photos = List<ProductPhotosEntity>.from(_store[contractId] ?? [])
      ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
    return Success(photos);
  }

  /// 테스트용: 저장소 초기화
  void clear() {
    _store.clear();
    _nextId = 1;
  }
}
