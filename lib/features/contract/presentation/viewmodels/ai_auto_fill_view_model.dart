import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/contract/data/services/image_filter_service.dart';
import 'package:trana/features/contract/domain/entities/contract_ai_extraction_entity.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';

part 'ai_auto_fill_view_model.freezed.dart';
part 'ai_auto_fill_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class AiAutoFillState with _$AiAutoFillState {
  const factory AiAutoFillState({
    DateTime? autoFillConsentedAt, // AI 자동기입 고지 동의 일자
    int? extractionId, // 진행 중인 extraction id
    @Default('') String platform, // 플랫폼 (AI 분석 결과)
    @Default('') String name, // 상품명 (AI 분석 결과)
    @Default(0) int amount, // 가격 (AI 분석 결과)
    @Default('') String condition, // 상품 상태 (AI 분석 결과)
    @Default('') String details, // 상품 상세 정보 (AI 분석 결과)

    @Default(false) bool isLoading,
    @Default(false) bool completed,
    String? error,
  }) = _AiAutoFillState;
}

// ==================== ViewModel ====================

@riverpod
class AiAutoFillViewModel extends _$AiAutoFillViewModel {
  @override
  AiAutoFillState build() {
    return const AiAutoFillState();
  }

  /// AI 자동기입 동의 일자 기록
  void consentAutoFill() {
    state = state.copyWith(autoFillConsentedAt: DateTime.now());
  }

  /// AI 이미지 분석 (requestPrefill → polling → loadPrefill)
  Future<bool> analyzeImages() async {
    if (state.autoFillConsentedAt == null) {
      state = state.copyWith(error: 'AI 자동기입 동의가 필요합니다.');
      return false;
    }

    final createState = ref.read(createContractViewModelProvider);
    final publicCode = createState.publicCode;
    if (publicCode == null) {
      state = state.copyWith(error: '계약 정보가 없습니다.');
      return false;
    }
    if (createState.attachmentIds.isEmpty) {
      state = state.copyWith(error: '분석할 첨부 사진이 없습니다.');
      return false;
    }

    state = state.copyWith(isLoading: true, completed: false);

    // 1. ImageFilterService 로 AI 분석에 사용할 이미지 필터링
    final xFiles = <XFile>[];
    for (final asset in createState.selectedImages) {
      final file = await asset.file;
      if (file != null) xFiles.add(XFile(file.path));
    }

    List<int> analysisIds = createState.attachmentIds;
    if (xFiles.isNotEmpty) {
      final filterService = ImageFilterService();
      try {
        final filtered = await filterService.extractBestImages(xFiles);
        // compressed path: originalPath + '_compressed.jpg' 이므로 역추적 가능
        final filteredOriginalPaths = filtered
            .map((f) => f.path.replaceFirst(RegExp(r'_compressed\.jpg$'), ''))
            .toSet();

        final filteredIds = <int>[];
        for (var i = 0; i < xFiles.length; i++) {
          if (filteredOriginalPaths.contains(xFiles[i].path) &&
              i < createState.attachmentIds.length) {
            filteredIds.add(createState.attachmentIds[i]);
          }
        }
        if (filteredIds.isNotEmpty) analysisIds = filteredIds;
      } finally {
        filterService.dispose();
      }
    }

    final result = await ref
        .read(contractAiExtractionRepositoryProvider)
        .analyzeImages(
          publicCode,
          attachmentIds: analysisIds,
          consentedAt: state.autoFillConsentedAt!,
        );

    if (result case Failure(:final failure)) {
      state = state.copyWith(isLoading: false, error: failure.message);
      return false;
    }

    final entity = (result as Success<ContractAiExtractionEntity>).data;
    final prefill = entity.prefill ?? {};
    state = state.copyWith(
      isLoading: false,
      completed: true,
      extractionId: entity.extractionId,
      platform: (prefill['trading_platform'] as String?) ?? '',
      name: (prefill['product_name'] as String?) ?? '',
      amount: (prefill['price'] as int?) ?? 0,
      condition: (prefill['condition_summary'] as String?) ?? '',
      details: (prefill['condition_details'] as String?) ?? '',
    );
    return true;
  }

  void clearError() => state = state.copyWith(error: null);
}
