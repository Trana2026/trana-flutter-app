import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/services/image_filter_service.dart';
import 'package:trana/features/contract/domain/entities/ai_auto_fill_entity.dart';
import 'package:trana/features/contract/domain/repositories/ai_auto_fill_repository.dart';

class AiAutoFillRepositoryImpl implements AiAutoFillRepository {
  AiAutoFillRepositoryImpl(this._filterService);

  final ImageFilterService _filterService;

  @override
  Future<Result<AiAutoFillEntity>> analyzeImages(List<XFile> images) async {
    try {
      // 하이브리드 추출
      final filtered = await _filterService.extractBestImages(images);
      throw UnimplementedError();
    } catch (e) {
      debugPrint('[AiAutoFillRepo] analyzeImages unexpected: $e');
      return const Failure(ServerFailure());
    }
  }
}
